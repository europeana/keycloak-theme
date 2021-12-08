<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
    <div class="pt-3">
      <h1 id="kc-page-title">
        ${msg("errorTitle")}
      </h1>
      <div class="instruction mt-3">
        <p>${message.summary?no_esc}
          <br/><a id="backToApplication" href="${properties.logoUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
        </p>
      </div>
    </div>
    </#if>
</@layout.registrationLayout>