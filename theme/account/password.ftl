<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

     <form action="${url.passwordUrl}" class="form-horizontal" method="post">
        <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">

        <#if password.passwordSet>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <label for="password" class="control-label">${msg("curpassword")}</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" class="form-control" id="password" name="password" autofocus autocomplete="current-password">
                </div>
            </div>
        </#if>

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <div class="form-group">
            <div class="${properties.kcInputWrapperClass!}">
                <label for="password-new" class="control-label">${msg("passwordNew")}</label>
            </div>

            <div class="${properties.kcInputWrapperClass!}">
                <input type="password" class="form-control" id="password-new" name="password-new" autocomplete="new-password" pattern=".{8,}">
                <small class="xs text-muted px-2">${msg("passwordDesc")}</small>
            </div>
        </div>

        <div class="form-group">
            <div class="${properties.kcInputWrapperClass!}">
                <label for="password-confirm" class="control-label" class="two-lines">${msg("passwordConfirm")}</label>
            </div>

            <div class="${properties.kcInputWrapperClass!}">
                <input type="password" class="form-control" id="password-confirm" name="password-confirm" autocomplete="new-password">
            </div>
        </div>

        <div class="form-group">
            <div id="kc-form-buttons" class="${properties.kcInputWrapperClass!}">
                <div class="form-buttons flex-row-reverse">
                    <button type="submit" class="btn btn-primary" name="submitAction" value="Save">${msg("changePassword")}</button>
                </div>
            </div>
        </div>
    </form>

</@layout.mainLayout>
