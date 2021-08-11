<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
      <ul id="nav" class="nav justify-content-center">
        <li class="nav-item">
          <a href="" class="nav-link nuxt-link-active">
            <span>${msg("signup")}</span>
          </a>
        </li>
      </ul>
    <div class="divider"></div>
    <div class="kcform">
      <h1 id="kc-page-title">
        ${msg("emailVerifyTitle")}
      </h1>
      <div class="instruction">
        <p>
          ${msg("emailVerifyInstruction1")}
          <br/>
          ${msg("emailVerifyInstruction2")} 
         </p>
      </div>
      <div class="${properties.kcFormGroupClass!}">
        <div class="${properties.kcInputWrapperClass!}">
          <div class="form-buttons flex-row-reverse">
            <a href="${url.loginAction}" class="btn btn-outline-primary text-decoration-none" role="button">${msg("emailResend")}</a>  
          </div>
        </div>
      </div>
    </div>
    </#if>
</@layout.registrationLayout>