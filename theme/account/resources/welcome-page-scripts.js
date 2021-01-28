/*
 * Copyright 2019 Red Hat, Inc. and/or its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
let isWelcomePage = function() {
  let winHash = window.location.hash;
  return winHash === '#/';
};

let toggleReact = function() {
  let welcomeScreen = document.getElementById('welcomeScreen');
  let spinnerScreen = document.getElementById('spinner_screen');
  let reactScreen = document.getElementById('main_react_container');

  if (!isWelcomePage() && !isReactLoading) {
    if (welcomeScreen) welcomeScreen.style.display = 'none';
    if (spinnerScreen) spinnerScreen.style.display = 'none';
    if (reactScreen) reactScreen.style.display = 'block';
    if (reactScreen) reactScreen.style.height = '100%';
  } else if (!isWelcomePage() && isReactLoading) {
    if (welcomeScreen) welcomeScreen.style.display = 'none';
    if (reactScreen) reactScreen.style.display = 'none';
    if (spinnerScreen) spinnerScreen.style.display = 'block';
    if (spinnerScreen) spinnerScreen.style.height = '100%';
  } else {
    window.location.replace(window.location.href + 'personal-info');
  }
};

function loggedInUserName() {
  let userName = l18nMsg['unknownUser'];
  if (keycloak.tokenParsed) {
    const givenName = keycloak.tokenParsed.given_name;
    const familyName = keycloak.tokenParsed.family_name;
    const preferredUsername = keycloak.tokenParsed.preferred_username;
    if (givenName && familyName) {
      userName = [givenName, familyName].reduce((acc, value, index) =>
        acc.replace('{{param_' + index + '}}', value), l18nMsg['fullName']
      );
    } else {
      userName = (givenName || familyName) || preferredUsername || userName;
    }
  }
  return userName;
}

let toggleMobileDropdown = function() {
  let mobileDropdown = document.getElementById('landingMobileDropdown');
  let mobileKebab = document.getElementById('landingMobileKebab');
  let mobileKebabButton = document.getElementById('landingMobileKebabButton');
  if (mobileDropdown.style.display === 'none') {
    mobileDropdown.style.display = 'block';
    mobileKebab.classList.add('pf-m-expanded');
    mobileKebabButton.setAttribute('aria-expanded', 'true');
  } else {
    mobileDropdown.style.display = 'none';
    mobileKebab.classList.remove('pf-m-expanded');
    mobileKebabButton.setAttribute('aria-expanded', 'false');
  }
};

let loadjs = function(url, loadListener) {
  const script = document.createElement('script');
  script.src = resourceUrl + url;
  script.type = 'module';
  if (loadListener) script.addEventListener('load', loadListener);
  document.head.appendChild(script);
};
