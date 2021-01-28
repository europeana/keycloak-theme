<#import "template.ftl" as layout>
<@layout.registrationLayout; section>

    <#if section = "header">
            ${msg("deleteAccountConfirm")}

   <#elseif section = "form">
  <div class="divider"></div>
  <div class="kcform">
    <form action="${url.loginAction}" method="post">
     <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">

       <div class="alert alert-warning" style="margin-top:0 !important;margin-bottom:30px !important">
           <span class="pficon pficon-warning-triangle-o"></span>
           ${msg("irreversibleAction")}
       </div>

       <p>${msg("deletingImplies")}</p>
       <ul style="color: #72767b;list-style: disc;list-style-position: inside;">
         <li>${msg("loggingOutImmediately")}</li>
         <li>${msg("errasingData")}</li>
       </ul>

        <p class="delete-account-text">${msg("finalDeletionConfirmation")}</p>
       </div>
       </div>
     <div class="form-group">
     <div class="col-12">
      <div class="form-buttons">
            <div class="p2 flex-fill">
            <input class="btn btn-outline-primary text-decoration-none" type="submit" value="${msg("doConfirmDelete")}" /></div>
            <#if triggered_from_aia>
            <div class="p2">
             <button class="btn btn-primary " type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
             </div>
            </#if>
          </div>
       </div>
      </div>
    </form>
   </div>
    
   </#if>

</@layout.registrationLayout>