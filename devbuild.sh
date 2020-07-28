#!/bin/bash
set -o errexit

# stop container keycloaktheme if exists
# docker stop keycloaktheme || true && docker  rm -f keycloaktheme || true && docker rmi europeana/keycloak-theme || true

echo building theme
npm run build

echo building image
docker build -t europeana/keycloak-theme .

echo copying build resources
cp -r dist/login/resources theme/login/resources

echo starting image
docker container run --rm -i --name europeana-keycloak-theme \
  -p 10001:8080 \
  --mount type=bind,source="$(pwd)"/theme,target=/opt/jboss/keycloak/themes/europeana \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=password \
  europeana/keycloak-theme
