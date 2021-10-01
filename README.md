# keycloak-theme
Europeana custom Keycloak theme.


## Developer Guide


### Run Keycloak with Docker Compose

From project root run:

```
npm install
```

With Docker running, and Compose installed, do:

```
KEYCLOAK_PASSWORD=password npm run dev
```

This will build a Docker image for Keycloak from the supplied [Dockerfile](./dev/Dockerfile) and run is as a Compose service to test the custom [theme](./theme). A [bind mount](https://docs.docker.com/storage/bind-mounts/) is used to mount the project's theme directory to the container. Caching for themes is turned off so any changes in .flt, .properties or .css files in [theme](./theme) directory can be previewed by reloading the page.

For theme updates to the SCSS do:

```
npm run scss:watch
```

In addition, a service for SMTP mail will be running so that password validation and reset may be tested.

### Setup a realm

Go to Keycloak's admin login page: http://localhost:10001/auth/admin/

Login using the `KEYCLOAK_USER` ("admin") and `KEYCLOAK_PASSWORD` ("password") credentials.

Go to the "Add realm" page: http://localhost:10001/auth/admin/master/console/#/create/realm

Upload the supplied [europeana-realm.json](./keycloak/europeana-realm.json) file and press `Create`.
This creates a "europeana" realm with login, email and theme settings, and
authentication flows all pre-configured.


<!-- ### Portal-specific configuration

The following optional configuration steps apply if setting up this Keycloak to work as an auth service
for the [Europeana Portal](https://github.com/europeana/portal.js).


#### Create client scope

Go to the "Add client scope" page: http://localhost:10001/auth/admin/master/console/#/create/client-scope/europeana

Create a new client scope with name "usersets".


### Create client

Go to the "Add Client" page: http://localhost:10001/auth/admin/master/console/#/create/client/europeana

Create a new client with ID "collections_portal", then configure as follows:
* Disable `implicit flow`
* Set `access type` to "public"
* Set `valid redirect URIs` to e.g. `http://localhost:3000/*`
* Set `base URL` to e.g. `http://localhost:3000/`
* Set `web origins` to `+` (to permit CORS requests from the portal app)

Save, then go to the "Client Scopes" tab and assign the "usersets" profile to the client. -->


## Testing the theme

Sign out of the admin console, and go to http://localhost:10001/auth/realms/europeana/account where you will see the custom theme.


## Theme updates

Directory [theme](./theme) contains all the files for the custom theme. There are three theme types: login, email and account

### Login

The login theme consists of:
* ftl ([Freemarker Template Language](https://freemarker.apache.org/)) templates
* theme.properties file for theme configuration
* messages folder that contains files for translated UI strings
* resources folder that contains css, js, fonts and images for the theme

#### Login ftl templates
[template.ftl](./theme/login/template.ftl) is the base template and offers the default layout which gets imported in all the other template files.
The other ftl files are for several pages on the login side of KeyCloak:
* [Login](./theme/login/login.ftl)
* [Join](./theme/login/register.ftl)
* [Verify e-mail](./theme/login/login-verify-email.ftl)
* [Reset password](./theme/login/login-reset-password.ftl)
* [Update password](./theme/login/login-update-password.ftl)
* [Login expired](./theme/login/login-page.ftl)
* [Error page](./theme/login/error.ftl)
* [Delete account confirmation](./theme/login/delete-account-confirm.ftl)
* [Info page](./theme/login/info.ftl) currently only appears to confirm deletion and offer a link back to the website

### Email

### Account / Account Console

Since the update to Keycloak 12 the new Account console became the default. [Read more](https://www.keycloak.org/docs/latest/release_notes/#new-account-console-is-now-the-default)
The account theme is a small [React](https://reactjs.org) app for user management called the 'Account Console'. It consists of:
* theme.properties file for theme configuration
  * imports resources from the login theme (styles, logo)
* messages folder that contains files for translated UI strings
* resources folder that contains React app files
* [index.ftl](./theme/account.index.ftl), the base template in which the Account Console app is loaded

#### Account Console App files
The Account Console is a React app. It makes use of predefined components from the [PatternFly](https://www.patternfly.org) design system.
* [Main.js](./theme/account/resources/Main.js) is the file that contains the app and gets loaded in the [index.ftl](./theme/account.index.ftl) template
* [welcome-page-scripts](./theme/account/resources/welcome-page-scripts.js) Defines what part of the app is loaded: loading screen, react screen (the account console) or the welcome screen (which we currently never show).
* [App.js](./theme/account/resources/App.js) this is the default component of each page with header and navigation
* [content.json](./theme/account/resources/content.json) Defines the pages which are included in the app and loaded in the page navigation [PageNav](./theme/account/resources/PageNav.js)
* [ContentPage](./theme/account/resources/content/ContentPage.js) component base layout for each content page including the title
* [content pages](./theme/account/resources/content) Page components for the content pages. Currently we are using:
  * [AccountPage](./theme/account/resources/content/account-page/AccountPage.js)
  * [ChangePasswordPage](./theme/account/resources/content/password-page/ChangePasswordPage.js)
  * [DeletePage](./theme/account/resources/content/delete-page/DeletePage.js)


### Custom stylesheets

Directory [scss](./scss) contains the SCSS files used to build the theme CSS. Compiled CSS for theme can be found in [theme resources](./theme/login/resources/css)

The SCSS is not autocompiled while developing. Changes won't be visible directly. To watch and compile changes while developing run:

```
npm run scss:watch
```

Changes can be previewed by reloading the Keycloak URL.

### Keycloak theme documentation

https://www.keycloak.org/docs/latest/server_development/index.html#_themes
These haven't been updated with docs for the new Account Console

#### Account console documentation
https://www.keycloak.org/docs/latest/server_development/index.html#_themes
Docs on the Account Console (here named User Account Service) configuration. Under [Themeable](https://www.keycloak.org/docs/latest/server_development/index.html#_themes) it again lacks documentation on the custom theming of the Account Console.

https://github.com/keycloak/keycloak-quickstarts/tree/latest/extend-account-console
Example of how to extend the Account Console

https://groups.google.com/g/keycloak-user/c/0b1yFcMlHpM/m/8K-iY0UOCwAJ
Email thread on customising the Account Console


#### Updating node_modules

https://github.com/keycloak/keycloak/blob/master/themes/UPDATING-NODE-MODULES.md


## License

Licensed under the EUPL v1.2.

For full details, see [LICENSE.md](LICENSE.md).
