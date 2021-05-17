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

In addition, a service for SMTP mail will be running so that password validation and reset may be tested.

### Setup a realm

Go to Keycloak's admin login page: http://localhost:10001/auth/admin/

Login using the `KEYCLOAK_USER` ("admin") and `KEYCLOAK_PASSWORD` ("password") credentials.

Go to the "Add realm" page: http://localhost:10001/auth/admin/master/console/#/create/realm

Upload the supplied [europeana-realm.json](./keycloak/europeana-realm.json) file and press `Create`.
This creates a "europeana" realm with login, email and theme settings, and
authentication flows all pre-configured.


### Portal-specific configuration

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

Go to the "Client Scopes" tab and assign the "usersets" profile to the client.


## Testing the theme

Sign out of the admin console, and go to http://localhost:10001/auth/realms/europeana/account where you will see the custom theme.


## Theme updates

Directory [theme](./theme) contains all the files for the custom theme.

Directory [scss](./scss) contains the SCSS files used to build the theme CSS. Compiled CSS for theme can be found in [theme resources](./theme/login/resources/css)

For theme updates to the SCSS do:

```
npm run scss:watch
```

Changes can be previewed by reloading the Keycloak URL.


## License

Licensed under the EUPL v1.2.

For full details, see [LICENSE.md](LICENSE.md).
