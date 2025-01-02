FROM openjdk:8-jre
ARG PHOTON_VERSION=0.4.2

# Install pbzip2 for parallel extraction
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        pbzip2 \
        wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /photon
ADD https://github.com/komoot/photon/releases/download/${PHOTON_VERSION}/photon-${PHOTON_VERSION}.jar /photon/photon.jar
COPY entrypoint.sh ./entrypoint.sh

VOLUME /photon/photon_data
EXPOSE 2322

ENTRYPOINT ["/photon/entrypoint.sh"]
