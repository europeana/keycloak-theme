<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <ul id="nav" class="nav justify-content-center">
         <li class="nav-item">
            <a href="${url.loginUrl}" target="_self" class="nav-link  nuxt-link-active">
               <span>${msg("doLogIn")}</span>
            </a>
         </li>
         <li class="nav-item">
            <a href="${url.registrationUrl}" class="nav-link">
               <span>${msg("signup")}</span>
            </a>
         </li>
    </ul>
    <div class="divider"></div>
    <div class="kcform">
        <#if realm.password>
            <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
              <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username">${msg("emailOrUsername")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <#if usernameEditDisabled??>
                        <input id="email" name="username" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                        <input id="email" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" required/>
                    </#if>
                </div>
              </div>

              <div class="${properties.kcFormGroupClass!}">
                  <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password">${msg("password")}</label>
                  </div>
                  <div class="${properties.kcInputWrapperClass!}">
                    <input id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" required/>
                  </div>
               </div>
                
               <div class="${properties.kcFormGroupClass!}">
               <div class="${properties.kcInputWrapperClass!}">
                    <div class="form-buttons">
                          <div class="flex-grow-1">
                            <a href="${url.loginResetCredentialsUrl}" class="btn btn-outline-primary text-decoration-none" role="button">${msg("forgotPassword")}</a>                         
                          </div>
                          <div class="flex">
                             <input class="btn btn-primary" name="login" type="submit" value="${msg("doLogIn")}"/>
                          </div>
                      </div>
                   </div>
                </div>
            </form>
        </#if>
        </div>
    </#if>
</@layout.registrationLayout>
