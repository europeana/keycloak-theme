<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
    <div>
      <ul id="nav" class="nav justify-content-center">
        <li class="nav-item">
          <a class="nav-link nuxt-link-active">
            <span>${msg("forgotPassword")}</span>
          </a>
        </li>
      </ul>
    <div class="divider"></div>
    </div>
    <div class="kcform">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <#if auth?has_content && auth.showUsername()>
                        <input type="email" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}" required/>
                    <#else>
                        <input type="email" id="username" name="username" class="${properties.kcInputClass!}" autofocus required/>
                    </#if>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!}">
               <div class="${properties.kcInputWrapperClass!}">
                    <div id="kc-form-buttons" class="form-buttons">
                          <div class="flex-grow-1">
                            <a href="${url.loginUrl}" class="btn btn-outline-primary text-decoration-none" role="button">${kcSanitize(msg("doCancel"))?no_esc}</a>                         
                          </div>
                          <div class="flex">
                             <input tabindex="5" class="btn btn-primary" name="login" id="kc-login" type="submit" value="${msg("resetPassword")}"/>
                          </div>
                    </div>
                </div>
           </div>
        </form>
     </div>
    </#if>
</@layout.registrationLayout>
