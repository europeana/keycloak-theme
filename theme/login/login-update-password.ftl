<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
    <ul id="nav" class="nav justify-content-center">
        <li class="nav-item">
          <a href="" class="nav-link nuxt-link-active">
            <span>${msg("updatePasswordTitle")}</span>
          </a>
        </li>
      </ul>
    <div class="divider"></div>
    <div class="kcform">
        <form action="${url.loginAction}" method="post">
            <input type="email" id="username" name="username" value="${username}" autocomplete="email" readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-new">${msg("passwordNew")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!}" pattern=".{8,}" autofocus autocomplete="new-password" required/>
                    <small class="xs text-muted px-2">${msg("passwordDesc")}</small>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm">${msg("passwordConfirm")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" name="password-confirm" class="${properties.kcInputClass!}" autocomplete="new-password" required/>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
               <div class="${properties.kcInputWrapperClass!}">
                   <div class="form-buttons flex-row-reverse">
                       <input class="btn btn-primary" type="submit" value="${msg("confirmPassword")}" />
                   </div>
               </div>
            </div>
        </form>
       </div>
    </#if>
</@layout.registrationLayout>
