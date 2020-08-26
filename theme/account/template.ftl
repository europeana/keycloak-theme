<#macro mainLayout active bodyClass>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>${msg("accountManagementTitle")}</title>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,700%7COpen+Sans:400italic,700italic,400,600,700&subset=latin,greek,cyrillic&display=swap" rel="stylesheet"/> 
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
        </#list>
    </#if>
</head>
<body>
<div class="kccontainer">
  <div class="kcinner container-fluid">
   <div class="row justify-content-center">
     <div class="kcbox">
      <header class="${properties.kcFormHeaderClass!}">
         <h1 id="kc-page-title" role="banner">
         <#if referrer?has_content && referrer.url?has_content><a href="${referrer.url}" id="referrer"><img src="${url.resourcesPath}/img/logo.svg"/></a>
         <#else><img src="${url.resourcesPath}/img/logo.svg"/></#if></h1>
      </header>
      
       <ul id="nav" class="nav justify-content-center">
         <li class="nav-item">
            <a href="${url.accountUrl}" target="_self" class="nav-link <#if active=='account'>nuxt-link-active</#if>">
               <span>${msg("editProfile")}</span>
            </a>
         </li>
         <li class="nav-item">
            <a href="${url.passwordUrl}" class="nav-link <#if active=='password'>nuxt-link-active</#if>">
               <span>${msg("changePassword")}</span>
            </a>
         </li>
        <!-- <li class="nav-item">
            <a href="#" class="nav-link">
               <span>${msg("deleteAccount")}</span>
            </a>
         </li> -->
        </ul>
        <div class="divider"></div>
        <div class="kcform">
     
         <#nested "content">
         </div>
         
         <#if message?has_content>
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
    </div>
    </div>
  </div>
  </div>
</body>
</html>
</#macro>