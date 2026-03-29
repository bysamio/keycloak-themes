<#import "template.ftl" as layout>
<@layout.emailLayout>
<p>${msg("emailUpdateConfirmationBody")}</p>
<p style="text-align: center;">
  <a href="${link}" class="email-cta">Confirm Email Update</a>
</p>
<p class="email-link-fallback">
  Or copy and paste this URL into your browser:<br>
  <a href="${link}">${link}</a>
</p>
<#if expirationInMinutes?has_content>
<p style="font-size: 13px; color: #6b7280;">${msg("emailUpdateConfirmationBodyExpiration", msg("linkExpirationFormatter.timePeriodUnit.minutes", expirationInMinutes))}</p>
</#if>
<p style="font-size: 13px; color: #6b7280;">If you didn&rsquo;t request this change, contact your administrator immediately.</p>
</@layout.emailLayout>
