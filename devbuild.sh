#!/bin/bash
set -o errexit

# stop container keycloaktheme if exists
# docker stop keycloaktheme || true && docker  rm -f keycloaktheme || true && docker rmi europeana/keycloak-theme || true

echo building theme
npm run build

echo building image
docker build -t europeana/keycloak-theme .

echo starting image
docker container run -i --name keycloaktheme \
  -p 10001:8080 \
  --mount type=bind,source="$(pwd)"/dist,target=/opt/jboss/keycloak/themes/europeana \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=password europeana/keycloak-theme
