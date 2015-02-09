#!/bin/bash

# Configure on first load..
if [ ! -f /tmp/supervisord-phpfpm.log ] ; then
  # TODO: pass in service environment variables

  touch /tmp/supervisord-phpfpm.log
fi

exec /usr/sbin/php-fpm
