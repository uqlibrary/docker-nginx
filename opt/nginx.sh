#!/bin/bash

# Configure on first load..
if [ ! -f /tmp/supervisord-nginx.log ] ; then
  mkdir -p /var/app/current

  cd /var/app/current

  if [ -f .docker/${APP_ENVIRONMENT}/bootstrap.sh ] ; then
    source .docker/${APP_ENVIRONMENT}/bootstrap.sh
  fi

  touch /tmp/supervisord-nginx.log
fi
su nobody -s /bin/bash
exec /usr/sbin/nginx
