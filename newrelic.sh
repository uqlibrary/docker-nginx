#!/bin/bash

if [ ! -f /tmp/supervisord-newrelic.log ] ; then
  export NR_INSTALL_SILENT=true
  export NR_INSTALL_KEY=${NEWRELIC_INSTALL_KEY}
  newrelic-install install
  touch /tmp/supervisord-newrelic.log
fi

nrsysmond-config --set license_key=${NEWRELIC_INSTALL_KEY}
exec /usr/sbin/nrsysmond -c /etc/newrelic/nrsysmond.cfg -l /dev/stdout -f
