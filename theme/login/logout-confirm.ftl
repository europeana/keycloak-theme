<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "pageTitle">
        ${msg("doLogout")}
    <#elseif section = "form">
      <div class="divider"></div>
      <div class="kcform">
        <h1 id="kc-page-title">
          ${msg("doLogout")}
        </h1>
        <div id="kc-logout-confirm" class="content-area">
            <p class="instruction">${msg("logoutConfirmHeader")}</p>

            <form class="form-actions" action="${url.logoutConfirmAction}" method="POST">
                <input type="hidden" name="session_code" value="${logoutConfirm.code}">
                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcInputWrapperClass!} form-buttons flex-row-reverse">
                            <input tabindex="4"
                                class="btn btn-primary"
                                name="confirmLogout" id="kc-logout" type="submit" value="${msg("doLogout")}"/>
                        </div>
                    </div>

                </div>
            </form>

            <div id="kc-info-message">
                <#if logoutConfirm.skipLink>
                <#else>
                    <#if (client.baseUrl)?has_content>
                        <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                    </#if>
                </#if>
            </div>

            <div class="clearfix"></div>
        </div>
      </div>
    </#if>
</@layout.registrationLayout>
