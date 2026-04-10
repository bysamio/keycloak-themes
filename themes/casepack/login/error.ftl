<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${kcSanitize(msg("errorTitle"))?no_esc}
    <#elseif section = "form">
        <div id="kc-error-message">
            <p class="instruction">${kcSanitize(message.summary)?no_esc}</p>

            <#if skipLink??>
            <#else>
                <div class="cp-error-actions">
                    <a href="${url.loginUrl}" class="cp-btn-primary">${msg("cpTrySignInAgain")}</a>
                    <#if client?? && client.baseUrl?has_content>
                        <a href="${client.baseUrl}" class="cp-btn-secondary">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                    </#if>
                </div>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
