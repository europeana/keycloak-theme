FROM jboss/keycloak:16.1.0

WORKDIR /opt/jboss/keycloak

COPY keycloak/disable-theme-cache.cli ../startup-scripts/disable-theme-cache.cli
