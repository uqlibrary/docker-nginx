#!/bin/bash

mkdir -p /data/www/public

if [ -n "$AWS_S3_OBJECT" ] ; then
  echo Copying application archive..
	aws s3 cp $AWS_S3_OBJECT app.zip
	echo Extracting to web server directory..
  unzip app.zip -d /data/www/public
fi
