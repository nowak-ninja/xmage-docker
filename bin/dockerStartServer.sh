#!/bin/sh

XMAGE_CONFIG=/xmage/mage-server/config/config.xml

sed -i -e "s#\(serverAddress=\)[\"].*[\"]#\1\"$XMAGE_DOCKER_SERVER_ADDRESS\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(serverName=\)[\"].*[\"]#\1\"$XMAGE_DOCKER_SERVER_NAME\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(port=\)[\"].*[\"]#\1\"$XMAGE_DOCKER_PORT\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(secondaryBindPort=\)[\"].*[\"]#\1\"$XMAGE_DOCKER_SECONDARY_BIND_PORT\"#g" ${XMAGE_CONFIG}

sed -i -e "s#\(maxSecondsIdle=\)[\"].*[\"]#\1\"$XMAGE_DOCKER_MAX_SECONDS_IDLE\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(authenticationActivated=\)[\"].*[\"]#\1\"$XMAGE_DOCKER_AUTHENTICATION_ACTIVATED\"#g" ${XMAGE_CONFIG}
sed -i -e "s#\(maxAiOpponents=\)[\"].*[\"]#\1\"$XMAGE_DOCKER_MAX_AI_OPPONENTS\"#g" ${XMAGE_CONFIG}

bash /xmage/mage-server/startServer.sh
