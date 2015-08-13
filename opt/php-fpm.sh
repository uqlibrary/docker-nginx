#!/bin/bash

# Configure on first load..
if [ ! -f /tmp/supervisord-phpfpm.log ] ; then
  # Wait until Nginx has been configured before launching
  while [ ! -f /tmp/supervisord-nginx.log ]
  do
    sleep 2
  done

  touch /tmp/supervisord-phpfpm.log
fi
su nobody -s /bin/bash
exec /usr/sbin/php-fpm
