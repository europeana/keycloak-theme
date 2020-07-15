#!/usr/bin/env bash
set -o errexit

echo copying bootstrap and jquery to theme resources
mkdir -p theme/login/resources/js
cp -R node_modules/bootstrap/dist/js/bootstrap.min.* theme/login/resources/js/
cp -R node_modules/jquery/dist/jquery.min.* theme/login/resources/js/
cp -R node_modules/@europeana/portal/assets assets

echo creating css file
npx sass --load-path=./node_modules --load-path=./assets/scss \
  custom/scss/style.scss:theme/login/resources/css/portallogin.css --update

echo starting Docker Compose
docker-compose up --build
