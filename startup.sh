#!/bin/sh
chown -R www-data:www-data /var/www/MPdashboard
service apache2 start

tail -f /dev/null
