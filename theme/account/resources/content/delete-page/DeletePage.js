function _defineProperty(obj, key, value) {
  if (key in obj) {
    Object.defineProperty(obj, key, { value, enumerable: true, configurable: true, writable: true });
  } else {
    obj[key] = value;
  } return obj;
}

/*
 * Copyright 2018 Red Hat, Inc. and/or its affiliates.
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
import * as React from '../../../../common/keycloak/web_modules/react.js';
import { ActionGroup, Button, Form, FormGroup, TextInput, Grid, GridItem, Expandable } from '../../../../common/keycloak/web_modules/@patternfly/react-core.js';
import { AccountServiceContext } from '../../account-service/AccountServiceContext.js';
import { Msg } from '../../widgets/Msg.js';
import { ContentPage } from '../ContentPage.js';
import { ContentAlert } from '../ContentAlert.js';
import { LocaleSelector } from '../../widgets/LocaleSelectors.js';
import { KeycloakContext } from '../../keycloak-service/KeycloakContext.js';
import { AIACommand } from '../../util/AIACommand.js';

/**
 * @author Stan Silvert ssilvert@redhat.com (C) 2018 Red Hat Inc.
 */
export class DeletePage extends React.Component {
  constructor(props) {
    super(props);

    _defineProperty(this, 'isDeleteAccountAllowed', features.deleteAccountAllowed);

    _defineProperty(this, 'handleDelete', keycloak => {
      new AIACommand(keycloak, 'delete_account').execute();
    });

    _defineProperty(this, 'handleCancel', () => {
      window.location.href = brandUrl;
    });

  }

  render() {
    return React.createElement(ContentPage, {
      title: 'deleteAccount'
    }, this.isDeleteAccountAllowed && React.createElement('div', {
      className: 'no-form-wrapper'
    }, React.createElement('div', {
      id: 'delete-account'
    }, React.createElement('p', null, React.createElement(Msg, {
      msgKey: 'deleteAccountWarning'
    })), React.createElement('p', null, React.createElement(Msg, {
      msgKey: 'deleteAccountContinue'
    }))), React.createElement('div', {
      className: 'no-form-actions'
    }, React.createElement(ActionGroup, null, React.createElement(Button, {
      id: 'cancel-btn',
      variant: 'secondary',
      onClick: this.handleCancel
    }, React.createElement(Msg, {
      msgKey: 'doCancel'
    })), React.createElement(KeycloakContext.Consumer, null, keycloak => React.createElement(Button, {
      id: 'delete-account-btn',
      variant: 'danger',
      onClick: () => this.handleDelete(keycloak)
    }, React.createElement(Msg, {
      msgKey: 'deleteAccount'
    })))))))
  }
}

_defineProperty(DeletePage, 'contextType', AccountServiceContext);

// # sourceMappingURL=DeletePage.js.map
