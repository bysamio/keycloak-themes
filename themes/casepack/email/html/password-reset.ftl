<#import "template.ftl" as layout>
<@layout.emailLayout>
<p>${msg("passwordResetBody")}</p>
<p style="text-align: center;">
  <a href="${link}" class="email-cta">Reset Password</a>
</p>
<p class="email-link-fallback">
  Or copy and paste this URL into your browser:<br>
  <a href="${link}">${link}</a>
</p>
<#if expirationInMinutes?has_content>
<p style="font-size: 13px; color: #6b7280;">${msg("passwordResetBodyExpiration", msg("linkExpirationFormatter.timePeriodUnit.minutes", expirationInMinutes))}</p>
</#if>
<p style="font-size: 13px; color: #6b7280;">If you didn&rsquo;t request this, you can safely ignore this email. Your password won&rsquo;t change.</p>
</@layout.emailLayout>
