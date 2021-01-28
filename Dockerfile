FROM quay.io/keycloak/keycloak:12.0.2

WORKDIR /opt/jboss/keycloak

COPY keycloak/disable-theme-cache.cli ../startup-scripts/disable-theme-cache.cli
