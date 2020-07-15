#!/bin/bash
set -o errexit

# stop container keycloaktheme if exists
# docker stop keycloaktheme || true && docker  rm -f keycloaktheme || true && docker rmi europeana/keycloak-theme || true

echo copying bootstrap and jquery to theme resources
mkdir -p theme/login/resources/js
cp -R node_modules/bootstrap/dist/js/bootstrap.min.* theme/login/resources/js/
cp -R node_modules/jquery/dist/jquery.min.* theme/login/resources/js/
cp -R node_modules/@europeana/portal/assets assets


echo creating css file
npx sass --load-path=./node_modules --load-path=./assets/scss custom/scss/style.scss:theme/login/resources/css/portallogin.css --update


echo building image
docker build -t europeana/keycloak-theme .

echo starting image
docker container run -i --name keycloaktheme \
  -p 10001:8080 \
  --mount type=bind,source="$(pwd)"/theme,target=/opt/jboss/keycloak/themes/europeana \
  -v "$(pwd)":/europeana \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=password europeana/keycloak-theme



