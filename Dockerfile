FROM  uqlibrary/docker-base

RUN \
  yum install -y nginx && \
  yum install -y \
    php-fpm \
    php-curl \
    php-gd \
    php-geoip \
    php-imagick \
    php-imap \
    php-json \
    php-ldap \
    php-mcrypt \
    php-memcache \
    php-memcached \
    php-mssql \
    php-mysqlnd \
    php-pgsql \
    php-redis \
    php-sqlite \
    php-xdebug \
    php-xmlrpc \
    php-xcache && \
  yum clean all

COPY nginx.conf /etc/nginx/nginx.conf
COPY site.conf /etc/nginx/conf.d/site.conf

COPY nginx.sh /opt/nginx.sh
RUN chmod +x /opt/nginx.sh

COPY www.conf /etc/php-fpm.d/www.conf

COPY php-fpm.sh /opt/php-fpm.sh
RUN chmod +x /opt/php-fpm.sh

RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php.ini && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php.ini && \
    sed -i "s/display_errors = Off/display_errors = stderr/" /etc/php.ini && \
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 30M/" /etc/php.ini && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php-fpm.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
