FROM jboss/keycloak:12.0.4

WORKDIR /opt/jboss/keycloak

COPY keycloak/disable-theme-cache.cli ../startup-scripts/disable-theme-cache.cli
