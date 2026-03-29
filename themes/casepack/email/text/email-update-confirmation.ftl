${msg("emailUpdateConfirmationBody")}

${link}

<#if expirationInMinutes?has_content>${msg("emailUpdateConfirmationBodyExpiration", msg("linkExpirationFormatter.timePeriodUnit.minutes", expirationInMinutes))}

</#if>If you didn't request this change, contact your administrator immediately.
