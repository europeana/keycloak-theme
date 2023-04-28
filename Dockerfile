FROM node:16-alpine AS build-theme

WORKDIR /build

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build


FROM quay.io/keycloak/keycloak:20.0.5 AS build-keycloak

WORKDIR /opt/keycloak

COPY --from=build-theme /build/theme ./themes/europeana
COPY ./keycloak/keycloak.conf ./conf/

RUN /opt/keycloak/bin/kc.sh build --http-relative-path=/auth


FROM quay.io/keycloak/keycloak:20.0.5

WORKDIR /opt/keycloak

COPY --from=build-keycloak /opt/keycloak ./
COPY ./keycloak/europeana-realm.json ./data/import/

HEALTHCHECK --start-period=5s --interval=5s --timeout=2s \
  CMD curl -fs http://localhost:8080/auth/realms/europeana/account/ || exit 1

CMD ["start", "--optimized", "--import-realm"]
