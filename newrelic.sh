#!/bin/bash

if [ ! -f /tmp/supervisord-newrelic.log ] ; then
  export NR_INSTALL_SILENT=true
  export NR_INSTALL_KEY=${NEWRELIC_INSTALL_KEY}
  newrelic-install install
  nrsysmond-config --set license_key=${NEWRELIC_INSTALL_KEY}
  touch /tmp/supervisord-newrelic.log
fi

exec /usr/sbin/nrsysmond -l /dev/stdout -f
