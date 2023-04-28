#!/usr/bin/env node

const fse = require('fs-extra');
const path = require('path');
const sass = require('sass');

const pkgName = require('../package').name;
console.log(`Building ${pkgName}...`);

const themePath = path.resolve(__dirname, '../theme');
const scssPath = path.resolve(__dirname, '../scss');

// Copy assets from package dependencies to theme dir
const requiredDirectories = ['login/resources/css', 'login/resources/js'];
for (const dir of requiredDirectories) {
  const requiredPath = path.join(themePath, dir);
  fse.ensureDirSync(requiredPath);
}

const assetDependencies = [
  // TODO: why does this need jquery?
  { resolve: 'jquery/package.json', src: 'dist/jquery.min.js', dst: 'login/resources/js/jquery.min.js' },
  { resolve: 'bootstrap/package.json', src: 'dist/js/bootstrap.min.js', dst: 'login/resources/js/bootstrap.min.js' },
  { resolve: '@europeana/portal/package.json', src: 'src/assets/fonts', dst: 'login/resources/fonts' },
  { resolve: '@europeana/portal/package.json', src: 'src/assets/img', dst: 'login/resources/img' },
  { resolve: '@europeana/portal/package.json', src: 'src/static/favicon.ico', dst: 'login/resources/img/favicon.ico' }
];
for (const dependency of assetDependencies) {
  const srcDirname = path.dirname(require.resolve(dependency.resolve));
  const srcPath = path.join(srcDirname, dependency.src);
  const dstPath = path.join(themePath, dependency.dst);
  fse.copySync(srcPath, dstPath);
}

// Generate CSS from SCSS and write to theme dir
const scssStylePath = path.join(scssPath, 'style.scss');
const result = sass.renderSync({
  file: scssStylePath,
  includePaths: assetDependencies.map((dependency) => (
    path.resolve(path.dirname(require.resolve(dependency.resolve)), '..')
  ))
});

const loginCssPath = path.join(themePath, 'login/resources/css/login.css');
fse.writeFileSync(loginCssPath, result.css);

console.log('Done.');
