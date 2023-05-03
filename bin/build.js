#!/usr/bin/env node

// TODO: replace this custom build script with webpack or similar

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
  // TODO: import from a CDN instead
  { resolve: 'bootstrap/package.json', src: 'dist/js/bootstrap.min.js', dst: 'login/resources/js/bootstrap.min.js' },
  { resolve: '@europeana/style/package.json', src: 'fonts', dst: 'login/resources/fonts' },
  { resolve: '@europeana/style/package.json', src: 'img', dst: 'login/resources/img' }
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
