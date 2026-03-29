<#import "template.ftl" as layout>
<@layout.emailLayout>
<p>${msg("emailVerificationBody")}</p>
<p style="text-align: center;">
  <a href="${link}" class="email-cta">Verify Email Address</a>
</p>
<p class="email-link-fallback">
  Or copy and paste this URL into your browser:<br>
  <a href="${link}">${link}</a>
</p>
<p style="font-size: 13px; color: #6b7280;">If you didn&rsquo;t create a CasePack account, you can safely ignore this email.</p>
</@layout.emailLayout>
