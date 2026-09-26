function prefillInvitationNames() {
  const form = document.getElementById('kc-register-form')
  if (!form) return

  const hints = new URLSearchParams(window.location.hash.slice(1))
  for (const [parameter, fieldName] of [
    ['bd_first_name', 'firstName'],
    ['bd_last_name', 'lastName'],
  ]) {
    const value = hints.get(parameter)?.trim()
    if (!value || value.length > 100) continue
    const field = form.elements.namedItem(fieldName)
    if (field instanceof HTMLInputElement && !field.value) field.value = value
  }

  if (hints.has('bd_first_name') || hints.has('bd_last_name')) {
    hints.delete('bd_first_name')
    hints.delete('bd_last_name')
    const remainingFragment = hints.toString()
    history.replaceState(history.state, '',
      location.pathname + location.search + (remainingFragment ? `#${remainingFragment}` : ''))
  }
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', prefillInvitationNames, { once: true })
} else {
  prefillInvitationNames()
}
