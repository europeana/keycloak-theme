FROM jboss/keycloak

ADD ./scripts/disable-theme-cache.cli /opt/jboss/startup-scripts/disable-theme-cache.cli

