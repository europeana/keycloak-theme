<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("pageExpiredTitle")}
    <#elseif section = "form">
    <div class="pt-3">
      <h1 id="kc-page-title">
        ${msg("pageExpiredTitle")}
      </h1>
      <div class="instruction mt-3">
        <p>
          ${msg("pageExpiredMsg1")} <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a> .<br/>
          ${msg("pageExpiredMsg2")} <a id="loginContinueLink" href="${url.loginAction}">${msg("doClickHere")}</a> .
        </p>
        </div>
    </div>
    </#if>
</@layout.registrationLayout>
