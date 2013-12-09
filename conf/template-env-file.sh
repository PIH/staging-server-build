#!/bin/bash

# Examples of variables for configuring staging server
COUNTRY=haiti
IMPLEMENTATION=university
STAGING_HOME=$HOME/$IMPLEMENTATION/staging

LOCAL_MYSQL_ROOT_PASSWORD=

REMOTE_USER_NAME=
DEFAULT_PORT=

PROD_WAR_SERVER=
PROD_WAR_FILE=/var/lib/tomcat6/webapps/openmrs.war
PROD_WAR_PORT=

PROD_OMOD_SERVER=
PROD_OMOD_FILES=/home/tomcat6/.OpenMRS/modules/*.omod
PROD_OMOD_PORT=$PROD_WAR_PORT

PROD_DB_SERVER=$IMPLEMENTATION.pih.org
PROD_DB_SERVER_FILE=/home/backup/current/openmrs.tar.7z
PROD_DB_SERVER_PORT=$DEFAULT_PORT
PROD_DB_PASSWORD=