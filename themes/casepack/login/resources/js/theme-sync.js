/**
 * Sync CasePack SPA theme preference to the Keycloak login page.
 *
 * The SPA sets a `casepack-theme` cookie with value "light" or "dark".
 * This script reads that cookie and overrides Keycloak's default
 * prefers-color-scheme behaviour on the <html> element.
 */
(function () {
  var match = document.cookie.match(/(?:^|;\s*)casepack-theme=(light|dark)/);
  if (!match) return;

  var theme = match[1];
  var root = document.documentElement;

  if (theme === 'light') {
    root.classList.remove('pf-v5-theme-dark');
  } else if (theme === 'dark') {
    root.classList.add('pf-v5-theme-dark');
  }
})();
