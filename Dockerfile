FROM node:16-alpine AS build

WORKDIR /build

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build


FROM alpine AS theme

WORKDIR /opt/keycloak/themes/europeana

COPY --from=build /build/theme ./
COPY --from=build /build/theme-v2 ../europeana-v2/


FROM quay.io/keycloak/keycloak:26.8.1 AS keycloak

WORKDIR /opt/keycloak

COPY --from=theme /opt/keycloak/themes/europeana ./themes/europeana
COPY ./theme-v2 ./themes/europeana-v2
COPY ./keycloak/keycloak.conf ./conf/

RUN /opt/keycloak/bin/kc.sh build --http-relative-path=/auth


FROM quay.io/keycloak/keycloak:26.8.1

WORKDIR /opt/keycloak

COPY --from=keycloak /opt/keycloak ./
COPY ./keycloak/europeana-realm.json ./data/import/

HEALTHCHECK --start-period=5s --interval=5s --timeout=2s \
  CMD curl -fs http://localhost:8080/auth/realms/europeana/account/ || exit 1

CMD ["start", "--optimized", "--import-realm", "--spi-login-protocol-openid-connect-legacy-logout-redirect-uri=true"]
