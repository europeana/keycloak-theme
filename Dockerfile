FROM jboss/keycloak

# Disable caching for themes

ADD ./standalone-ha.xml /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml


