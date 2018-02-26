#!/bin/bash
sed -i.bak 's/'%mailpass%'/'"$MAILPASSWORD"'/' /var/www/.env
sed -i.bak 's/'%dbpass%'/'"$PASSWORD"'/' /var/www/.env

cd /var/www
php yii generation
php yii reminder
php yii cleanup
