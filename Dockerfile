FROM  uqlibrary/docker-base

RUN \
  yum install -y nginx && \
  yum install -y \
    php56u-common \
    php56u-fpm \
    php56u-gd \
    php56u-pecl-geoip \
    php56u-imap \
    php56u-ldap \
    php56u-mcrypt \
    php56u-pecl-memcached \
    php56u-mysqlnd \
    php56u-sqlite \
    php56u-xmlrpc && \
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
