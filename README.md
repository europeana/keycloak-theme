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
KEYCLOAK_ADMIN_PASSWORD=password npm run dev
```

This will build a Docker image for Keycloak from the supplied [Dockerfile](./dev/Dockerfile) and run is as a Compose service to test the custom [theme](./theme). A [bind mount](https://docs.docker.com/storage/bind-mounts/) is used to mount the project's theme directory to the container. Caching for themes is turned off so any changes in .flt, .properties or .css files in [theme](./theme) directory can be previewed by reloading the page.

For theme updates to the SCSS do:

```
npm run scss:watch
```

In addition, a service for SMTP mail will be running so that password validation and reset may be tested.


## Testing the theme

Go to http://localhost:10001/auth/realms/europeana/account/#/ where you will see the custom theme.

### Keycloak admin

Go to Keycloak's admin login page: http://localhost:10001/auth/admin/master/console/#/

Login using the `KEYCLOAK_ADMIN` ("admin") and `KEYCLOAK_ADMIN_PASSWORD` ("password") credentials.

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
The account theme is a [React](https://reactjs.org) app for user management called the 'Account Console'. It consists of:
* theme.properties file for theme configuration
  * imports resources from the login theme (styles, logo)
* messages folder that contains files for translated UI strings


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


## License

Licensed under the EUPL v1.2.

For full details, see [LICENSE.md](LICENSE.md).
