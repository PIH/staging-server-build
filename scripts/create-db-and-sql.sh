#!/bin/bash

# This will clean the old database from mysql, recreate a new database, grant user permissions,
#	and source the production database on the staging server.

set -e

case $1 in
	rwink | butaro | rwink-local | butaro-local )		source $HOME/.envStaging/$1.conf;;

	malawi ) 		echo "$1 configuration is incomplete"
			 		exit 1 ;;

	* )  			echo "Usage: $0 rwink|butaro|rwink-local|butaro-local|malawi"
		 			exit 1
esac

# Additional variables
SQL_INIT=drop-and-create.sql

# Create the $IMPLEMENTATION database
cd $STAGING_HOME/database/production
rm -f $SQL_SCRIPT
ln -s $SOURCE_HOME/scripts/$SQL_SCRIPT .

# Drop and create blank database with user
echo "Drop and create $IMPLEMENTATION database"
echo "  and grant user openmrs access"
mysql -u root -p$MYSQL_ROOT_PASSWD mysql -e "set @prod_db_name = '$IMPLEMENTATION'; set @myuser = '$MYSQL_USER'; set @passed = '$MYSQL_ROOT_PASSWD'; source $SQL_INIT;"

# Source the database on the staging server
echo "Source the production $IMPLEMENTATION database"
mysql -u $MYSQL_USER -p$MYSQL_ROOT_PASSWD $IMPLEMENTATION -e "source openmrs.sql;"