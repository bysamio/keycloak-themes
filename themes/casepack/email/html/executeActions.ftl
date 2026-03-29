<#import "template.ftl" as layout>
<@layout.emailLayout>
<p>${msg("executeActionsBody")}</p>
<p>You need to ${msg("requiredAction.${requiredActions[0]}")}<#if requiredActions?size gt 1><#list requiredActions[1..] as action>, ${msg("requiredAction.${action}")}</#list></#if>.</p>
<p style="text-align: center;">
  <a href="${link}" class="email-cta">Complete Account Setup</a>
</p>
<p class="email-link-fallback">
  Or copy and paste this URL into your browser:<br>
  <a href="${link}">${link}</a>
</p>
<#if expirationInMinutes?has_content>
<p style="font-size: 13px; color: #6b7280;">${msg("executeActionsBodyExpiration", msg("linkExpirationFormatter.timePeriodUnit.minutes", expirationInMinutes))}</p>
</#if>
<p style="font-size: 13px; color: #6b7280;">If you didn&rsquo;t expect this email, you can safely ignore it.</p>
</@layout.emailLayout>
