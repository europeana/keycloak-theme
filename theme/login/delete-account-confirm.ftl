<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <#if section = "header">
    ${msg("deleteAccountConfirm")}
  <#elseif section = "form">
  <div class="kcform">
    <form action="${url.loginAction}" method="post">
      <div class="${properties.kcFormGroupClass!} col-extra-padding">
        <h1 id="kc-page-title" class="not-centred">
          ${msg("deleteAccountConfirm")}
        </h1>
        <div class="${properties.kcLabelWrapperClass!}">
          <p style="margin-bottom: 0;">${msg("finalDeletionConfirmation1")}</p>
          <p style="margin-bottom: 0; font-weight: 700;">${msg("finalDeletionConfirmation2")}</p>
          <p style="margin-bottom: 1.5rem;">${msg("finalDeletionConfirmation3")}</p>

          <p style="margin-bottom: 0;">${msg("deletingImplies")}</p>
          <ul>
            <li style="font-weight: 700;">${msg("loggingOutImmediately")}</li>
            <li style="font-weight: 700;">${msg("errasingData")}</li>
          </ul>
        </div>
      </div>
     <div class="form-group">
     <div class="col-12">
      <div class="form-buttons d-block">
        <div class="p2 d-flex justify-content-between">
          <#if triggered_from_aia>
            <div class="p2">
              <button class="btn btn-outline-primary " type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
            </div>
          </#if>
            <input class="btn btn-danger text-uppercase" type="submit" value="${msg("deleteAccount")}" /></div>
          </div>
       </div>
      </div>
    </form>
   </div>    
  </#if>
</@layout.registrationLayout>
