#!/bin/bash

if [ ! -f /tmp/supervisord-newrelic.log ] ; then
  newrelic-install install
  nrsysmond-config --set license_key=${NEWRELIC_INSTALL_KEY}
  touch /tmp/supervisord-newrelic.log
fi

exec /usr/sbin/nrsysmond -c /etc/newrelic/nrsysmond.cfg -l /dev/stdout -f
