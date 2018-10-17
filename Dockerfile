FROM ubuntu:16.04

RUN apt-get update && apt-get install -y software-properties-common \
 && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && apt-get update && apt-get install -y \
    curl \
    jq \
    default-jre \
    unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# XMage Defaults
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle \
    XMAGE_DOCKER_SERVER_ADDRESS="0.0.0.0" \
    XMAGE_DOCKER_PORT="17171" \
    XMAGE_DOCKER_SECONDARY_BIND_PORT="17179" \
    XMAGE_DOCKER_SERVER_NAME="xmage-server"

WORKDIR /xmage

RUN curl http://xmage.de/xmage/config.json | jq '.XMage.location' | xargs curl -L > xmage.zip \
  ; unzip xmage.zip \
  ; rm xmage.zip

COPY *.sh /xmage/mage-server/

RUN chmod +x \
    /xmage/mage-server/startServer.sh \
    /xmage/mage-server/dockerStartServer.sh

RUN awk '{ sub("\r$", ""); print }' /xmage/mage-server/startServer.sh > /xmage/mage-server/startServer_unix.sh \
   ; mv /xmage/mage-server/startServer_unix.sh /xmage/mage-server/startServer.sh

EXPOSE $XMAGE_DOCKER_PORT $XMAGE_DOCKER_SECONDARY_BIND_PORT

WORKDIR /xmage/mage-server

CMD [ "./dockerStartServer.sh" ]
