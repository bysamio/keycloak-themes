<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>
            ${messageHeader}
        <#else>
            ${message.summary}
        </#if>
    <#elseif section = "form">
        <div id="kc-info-message">
            <p class="instruction">${message.summary}</p>

            <#if skipLink??>
            <#else>
                <#if pageRedirectUri?has_content>
                    <p class="cp-back-link">
                        <a href="${pageRedirectUri}" class="cp-btn-primary">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                    </p>
                <#elseif actionUri?has_content>
                    <p class="cp-back-link">
                        <a href="${actionUri}" class="cp-btn-primary">${kcSanitize(msg("proceedWithAction"))?no_esc}</a>
                    </p>
                <#elseif (client.baseUrl)?has_content>
                    <p class="cp-back-link">
                        <a href="${client.baseUrl}" class="cp-btn-primary">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                    </p>
                <#else>
                    <p class="cp-back-link">
                        <a href="${url.loginUrl}" class="cp-btn-primary">${msg("cpContinueToLogin")}</a>
                    </p>
                </#if>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
