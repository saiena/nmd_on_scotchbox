#!/usr/bin/env bash

# get list of SQL files to process
echo -e "\n--- Getting list of database Files ---\n"
DBASE_FILES=/var/www/nmd_on_scotchbox/nmd_provisioning/databases/*.sql

if [ ! -f ${DBASE_FILES[0]} ]; then
    echo -e "\n--- No database files found ---\n"
    exit 0
fi

# iterate list of files and process
for f in $DBASE_FILES
do
    DATABASE_NAME=`basename "$f" .sql`

    if [ ! -d /var/lib/mysql/"$DATABASE_NAME" ];
    then
        # drop database
        echo "DROP DATABASE IF EXISTS $DATABASE_NAME" | mysql -uroot -proot

        # create database and set privileges
        echo "CREATE DATABASE $DATABASE_NAME" | mysql -uroot -proot
        echo "GRANT ALL ON $DATABASE_NAME.* TO 'root'@'localhost'" | mysql -uroot -proot
        echo "flush privileges" | mysql -uroot -proot
        # load data
        mysql -uroot -proot "$DATABASE_NAME" < /var/www/xyz_vagrant_box/xyz_provisioning/databases/"$DATABASE_NAME".sql 2> /dev/null
    fi
done