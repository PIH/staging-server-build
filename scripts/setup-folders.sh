#!/bin/bash

# Create all the staging server directories for openmrs
# -- openmrs war
# -- openmrs modules
# -- openmrs databases

set -e

case $1 in
	rwink | butaro ) 	echo "Creating $HOME/staging/$1 directory"
						source $HOME/.envStaging/$1.conf;;

	malawi | neno ) 	echo "$1 configuration is incomplete, but rwanda works ;)"
			 			exit 1 ;;

	* )  		echo "Usage: $0 rwink|butaro|malawi"
		 		exit 1
esac

#echo 'Run this as the tomcat6 user'
echo "This staging area is created by $(whoami) user"
mkdir -p $HOME/staging
cd $HOME/staging
echo "  in $(pwd) directory"
echo ''
mkdir -p $STAGING_HOME
cd $STAGING_HOME

echo 'Create warfile directory for production and dev/test'
mkdir -p warfile

echo 'Create modules directories'
rm -rf modules
mkdir -p modules/
mkdir -p modules/production
mkdir -p modules/dev

echo 'Create database directories'
rm -rf database
mkdir -p database
mkdir -p database/production
mkdir -p database/de-identified
mkdir -p database/de-id-and-trim