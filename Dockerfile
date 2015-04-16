FROM uqlibrary/docker-base:latest

RUN rpm -Uvh http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm

RUN \
  yum install -y nginx && \
  yum install -y \
    php56u-common \
    php56u-fpm \
    php56u-gd \
    php56u-imap \
    php56u-ldap \
    php56u-mcrypt \
    php56u-mssql \
    php56u-mysqlnd \
    php56u-pdo \
    php56u-pecl-geoip \
    php56u-pecl-memcached \
    php56u-pecl-redis \
    php56u-pgsql \
    php56u-sqlite \
    php56u-soap \
    php56u-xmlrpc \
    php56u-mbstring \
    php56u-tidy \
    newrelic-php5 \
    newrelic-sysmond && \
  yum clean all

COPY etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY etc/nginx/conf.d/site.conf /etc/nginx/conf.d/site.conf

COPY opt/nginx.sh /opt/nginx.sh
RUN chmod +x /opt/nginx.sh

COPY etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf

COPY opt/php-fpm.sh /opt/php-fpm.sh
RUN chmod +x /opt/php-fpm.sh

RUN sed -i "s/;date.timezone =.*/date.timezone = Australia\/Brisbane/" /etc/php.ini && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php.ini && \
    sed -i "s/display_errors = Off/display_errors = stderr/" /etc/php.ini && \
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 30M/" /etc/php.ini && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php-fpm.conf

COPY opt/newrelic.sh /opt/newrelic.sh
RUN chmod +x /opt/newrelic.sh

COPY etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80 81
