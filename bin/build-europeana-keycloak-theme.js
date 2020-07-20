#!/usr/bin/env node

const fse = require('fs-extra');
const path = require('path');
const sass = require('sass');

fse.removeSync(path.resolve(__dirname, '../dist'));
fse.copySync(path.resolve(__dirname, '../theme'), path.resolve(__dirname, '../dist'));
fse.ensureDirSync(path.resolve(__dirname, '../dist/login/resources/css'));
fse.ensureDirSync(path.resolve(__dirname, '../dist/login/resources/js'));
fse.copySync(
  path.resolve(__dirname, '../node_modules/jquery/dist/jquery.min.js'),
  path.resolve(__dirname, '../dist/login/resources/js/jquery.min.js')
);
fse.copySync(
  path.resolve(__dirname, '../node_modules/bootstrap/dist/js/bootstrap.min.js'),
  path.resolve(__dirname, '../dist/login/resources/js/bootstrap.min.js')
);
fse.copySync(
  path.resolve(__dirname, '../node_modules/@europeana/portal/assets/fonts'),
  path.resolve(__dirname, '../dist/login/resources/fonts')
);
fse.copySync(
  path.resolve(__dirname, '../node_modules/@europeana/portal/assets/img'),
  path.resolve(__dirname, '../dist/login/resources/img')
);
fse.copySync(
  path.resolve(__dirname, '../node_modules/@europeana/portal/static/favicon.ico'),
  path.resolve(__dirname, '../dist/login/resources/img/favicon.ico')
);

const result = sass.renderSync({
  file: path.resolve(__dirname, '../scss/style.scss'),
  includePaths: [
    path.resolve(__dirname, '../node_modules')
  ]
});

fse.writeFileSync(path.resolve(__dirname, '../dist/login/resources/css/login.css'), result.css);
