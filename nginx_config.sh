#!/bin/bash

sed -i "s/%fpm-ip%/${PHPFPM_SERVICE_HOST}/" /etc/nginx/nginx.conf
sed -i "s/%fpm-port%/${PHPFPM_SERVICE_PORT}/" /etc/nginx/nginx.conf

# Temporary test
mkdir -p /data/www/public
cat > /data/www/public/test.php << EOF
<?php
phpinfo();

EOF