<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow"/>
    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,700%7COpen+Sans:400italic,700italic,400,600,700&subset=latin,greek,cyrillic&display=swap" rel="stylesheet"/>
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body>
<div class="kccontainer">
  <div class="kcinner container-fluid">
   <div class="row justify-content-center">
     <div class="kcbox">
      <header class="${properties.kcFormHeaderClass!}">
        <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
            <a href="https://www.europeana.eu" aria-label="${msg("linkHome")}">
                <h1 id="kc-page-title" role="banner">
                    <img src="${url.resourcesPath}/img/logo.svg" alt="${msg("linkHome")}"/>
                </h1>
            </a>
        </#if>
      </header>

         <#nested "form">

         <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
         <#-- Hide warnings -->
         <#if message.type != 'warning'>
          <div class="${properties.kcFormGroupClass!}">
           <div class="${properties.kcInputWrapperClass!}">
            <div class="flex mb-2 px-2">
              <div class="alert alert-${message.type}">
                  <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                  <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
              </div>
             </div>
            </div>
           </div>
          </#if>
         </#if>
    </div>
    </div>
  </div>
  </div>
</body>
</html>
</#macro>