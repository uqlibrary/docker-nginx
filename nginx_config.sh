#!/bin/bash

mkdir -p /data/www/public

if [ -n "$AWS_S3_OBJECT" ] ; then
	aws s3 cp $AWS_S3_OBJECT
  unzip app.zip -d /data/www/public
fi
