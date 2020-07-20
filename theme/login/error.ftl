<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
    <div class="pt-3">
      <div class="instruction mt-3">
              <p>${message.summary?no_esc}
                <#if client?? && client.baseUrl?has_content>
                    <br/><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                </#if>
              </p>
      </div>
    </div>
    </#if>
</@layout.registrationLayout>