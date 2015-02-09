#!/bin/bash

# Configure on first load..
if [ ! -f /tmp/supervisord-nginx.log ] ; then
  mkdir -p /data/www

  # Grab the code from an S3 bucket?
  if [ -n "$AWS_S3_OBJECT" ] ; then
    echo Copying application archive..
    aws s3 cp $AWS_S3_OBJECT app.zip
    echo Extracting to web server directory..
    unzip app.zip -d /data/www
    cd /data/www

    if [ -f .kubernetes/bootstrap.sh ] ; then
      source .kubernetes/bootstrap.sh
    fi
  fi

  touch /tmp/supervisord-nginx.log
fi

exec /usr/sbin/nginx
