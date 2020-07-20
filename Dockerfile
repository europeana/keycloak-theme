FROM jboss/keycloak

WORKDIR /opt/jboss/keycloak

COPY europeana-realm.json /tmp
ENV KEYCLOAK_IMPORT=/tmp/europeana-realm.json

ADD ./scripts/disable-theme-cache.cli /opt/jboss/startup-scripts/disable-theme-cache.cli
