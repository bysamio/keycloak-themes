${msg("executeActionsBody")}

${msg("requiredAction.${requiredActions[0]}")}<#if requiredActions?size gt 1><#list requiredActions[1..] as action>, ${msg("requiredAction.${action}")}</#list></#if>.

${link}

<#if expirationInMinutes?has_content>${msg("executeActionsBodyExpiration", msg("linkExpirationFormatter.timePeriodUnit.minutes", expirationInMinutes))}

</#if>If you didn't expect this email, you can safely ignore it.
