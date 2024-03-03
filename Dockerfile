# Set global variables
ARG KC_VERSION=23.0.7

# Stage 1: Maven Build
FROM maven:3.9.6-eclipse-temurin-21-alpine AS mavenbuilder
COPY spi /usr/src/app/spi
RUN mvn -f /usr/src/app/spi/pom.xml clean package

# Stage 2: Keycloak Builder
FROM quay.io/keycloak/keycloak:${KC_VERSION} AS builder
COPY --from=mavenbuilder /usr/src/app/spi/target/*.jar /opt/keycloak/providers
ENV KC_HEALTH_ENABLED=true \
    KC_METRICS_ENABLED=true \
    KC_PROXY=edge
COPY themes/my-custom-theme /opt/keycloak/themes/my-custom-theme
WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

# Stage 3: Final Keycloak Image
FROM quay.io/keycloak/keycloak:${KC_VERSION}
COPY --from=builder /opt/keycloak/ /opt/keycloak/
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
