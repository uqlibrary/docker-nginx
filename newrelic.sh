#!/bin/bash

if [ ! -f /tmp/supervisord-newrelic.log ] ; then
  # Wait until Nginx has been configured before launching
  while [ ! -f /tmp/supervisord-nginx.log ]
  do
    sleep 2
  done

  echo Using install key: $NEWRELIC_INSTALL_KEY

  export NR_INSTALL_SILENT=true
  export NR_INSTALL_KEY=$NEWRELIC_INSTALL_KEY
  newrelic-install install
  nrsysmond-config --set license_key=$NEWRELIC_INSTALL_KEY
  touch /tmp/supervisord-newrelic.log
fi

exec /usr/sbin/nrsysmond -l /dev/stdout -f
