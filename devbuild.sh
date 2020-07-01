#!/bin/bash
set -o errexit

# stop container keycloaktheme if exists
# docker stop keycloaktheme || true && docker  rm -f keycloaktheme || true && docker rmi theme/keycloak || true

echo bootstrap and jquery to theme resources
mkdir -p theme/login/resources/js
cp -R node_modules/bootstrap/dist/js/bootstrap.min.* theme/login/resources/js/
cp -R node_modules/jquery/dist/jquery.min.* theme/login/resources/js/


declare -r currentDir="$(dirname "${BASH_SOURCE[0]}")"
echo create css file
sass --load-path=${currentDir}/node_modules --load-path=${currentDir}/assets/scss custom/scss/style.scss:theme/login/resources/css/portallogin.css --update


echo building image
docker build -t theme/keycloak .

echo starting image
docker container run -d --name keycloaktheme \
  -p 10001:8080 \
  --mount type=bind,source="$(pwd)"/theme,target=/opt/jboss/keycloak/themes/portaltheme \
  -v "$(pwd)":/portaltheme \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=password \
  theme/keycloak

echo -e "Build complete\n\nKeycloak running on http://localhost:10001\n"



