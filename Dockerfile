FROM jboss/keycloak

<<<<<<< HEAD
ARG config=/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml

COPY europeana-realm.json /tmp
ENV KEYCLOAK_IMPORT=/tmp/europeana-realm.json
=======
ADD ./scripts/disable-theme-cache.cli /opt/jboss/startup-scripts/disable-theme-cache.cli
>>>>>>> master

# Disable caching for themes
RUN sed -ir 's/<staticMaxAge>[^<]*<\/staticMaxAge>/<staticMaxAge>-1<\/staticMaxAge>/' ${config} && \
  sed -ir 's/<cacheThemes>[^<]*<\/cacheThemes>/<cacheThemes>false<\/cacheThemes>/' ${config} && \
  sed -ir 's/<cacheTemplates>[^<]*<\/cacheTemplates>/<cacheTemplates>false<\/cacheTemplates>/' ${config}
