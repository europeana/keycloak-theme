FROM jboss/keycloak:10.0.2

WORKDIR /opt/jboss/keycloak

COPY dist themes/europeana

COPY keycloak/disable-theme-cache.cli ../startup-scripts/disable-theme-cache.cli
