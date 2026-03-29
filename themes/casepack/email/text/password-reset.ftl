${msg("passwordResetBody")}

${link}

<#if expirationInMinutes?has_content>${msg("passwordResetBodyExpiration", msg("linkExpirationFormatter.timePeriodUnit.minutes", expirationInMinutes))}

</#if>If you didn't request this, you can safely ignore this email. Your password won't change.
