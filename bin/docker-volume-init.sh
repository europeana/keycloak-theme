#!/usr/bin/env sh

set -e
volume="$(basename ${PWD})_keycloak-data-h2-db"
docker volume create ${volume}
docker run \
  --rm \
  --entrypoint chown \
  -v ${volume}:/keycloak \
  alpine -R 1000:0 /keycloak
