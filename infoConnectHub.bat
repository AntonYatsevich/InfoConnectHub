@echo off
set /p ENCRYPTION_PASS=Please enter a password that will be used for encryption/decryption:

set "JAVA_OPTS=-Djasypt.encryptor.password=%ENCRYPTION_PASS%"
set "JYTHON_OPTS=-Dpython.home=./info-connect-rpa-hub/executable-jars/jython-standalone-2.7.1.jar"
set OAUTH_ENABLED=true
set RPA_ENABLED=true

rem Run InfoConnectHub
java %JAVA_OPTS% -jar ./info-connect-hub/executable-jars/info_connect_hub-2.0.0.jar --spring.config.location=./info-connect-hub/config/application.properties > ./log/infoConnectHub.log

if "!OAUTH_ENABLED!" == "true" (
  rem Run InfoConnectHub
  java %JAVA_OPTS% -jar ./info-connect-oauth-hub/executable-jars/authorization_server-2.0.0.jar --spring.config.location=./info-connect-oauth-hub/config/application.properties > ./log/infoConnectOAuthHub.log
)

if "!RPA_ENABLED!" == "true" (
  rem Run InfoConnectHub
  java %JAVA_OPTS% %JYTHON_OPTS% -jar ./info-connect-rpa-hub/executable-jars/info_connect_rpa_hub-2.0.0.jar --spring.config.location=./info-connect-rpa-hub/config/application.properties > ./log/infoConnectOAuthHub.log
)
