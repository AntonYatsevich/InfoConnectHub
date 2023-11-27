#!/bin/bash
echo "Please enter a password that will be used for encryption/decryption:"
read ENCRYPTION_PASS

LOG_FILE="./log/infoConnectHub.log"
# Clear log file
> "$LOG_FILE"

LOG_FILE_OAUTH="./log/infoConnectOAuthHub.log"
# Clear log file
> "$LOG_FILE_OAUTH"

LOG_FILE_RPA="./log/infoConnectRPAHub.log"
# Clear log file
> "$LOG_FILE_RPA"

JAVA_OPTS="-Djasypt.encryptor.password=$ENCRYPTION_PASS"
JYTHON_OPTS="-Dpython.home=./info-connect-rpa-hub/executable-jars/jython-standalone-2.7.1.jar"
OAUTH_ENABLED=true
RPA_ENABLED=true

# Run InfoConnect Hub
java $JAVA_OPTS -jar ./info-connect-hub/executable-jars/info_connect_hub-2.0.0.jar --spring.config.location=./info-connect-hub/config/application.properties >> "$LOG_FILE" 2>&1

if [[ $RPA_ENABLED == "true" ]]; then
# Run InfoConnect RPA Hub
java $JAVA_OPTS $JYTHON_OPTS -jar ./info-connect-rpa-hub/executable-jars/info_connect_rpa_hub-2.0.0.jar --spring.config.location=./info-connect-rpa-hub/config/application.properties >> "$LOG_FILE_RPA" 2>&1
fi

if [[ $OAUTH_ENABLED == "true" ]]; then
# Run InfoConnect OAuth Hub
java $JAVA_OPTS -jar ./info-connect-oauth-hub/executable-jars/authorization_server-2.0.0.jar --spring.config.location=./info-connect-oauth-hub/config/application.properties >> "$LOG_FILE_OAUTH" 2>&1
fi
