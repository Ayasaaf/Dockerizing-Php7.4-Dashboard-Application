FROM php:7.4.33-apache
WORKDIR /
COPY  MPdashboard  /var/www/MPdashboard
COPY default-ssl.conf /etc/apache2/sites-enabled
RUN rm /etc/apache2/sites-enabled/000-default.conf 
COPY 000-default.conf /etc/apache2/sites-enabled
RUN rm -rf /var/www/html
RUN mkdir -p /var/www/ssl 
COPY server.crt /var/www/ssl
COPY server.key /var/www/ssl
COPY ca.crt  /var/www/ssl
COPY startup.sh .
RUN a2enmod ssl && a2enmod rewrite && a2enmod headers  
RUN apt-get update && apt-get install -y libicu-dev vim && docker-php-ext-install intl mysqli pdo pdo_mysql
COPY ioncube  /tmp/ioncube 
RUN cp /tmp/ioncube/ioncube_loader_lin_7.4.so /usr/local/lib/php/extensions/no-debug-non-zts-20190902
COPY php.ini /usr/local/etc/php/php.ini





EXPOSE 80
EXPOSE 443
ENTRYPOINT ./startup.sh
