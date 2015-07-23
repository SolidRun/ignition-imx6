#!/bin/bash
set -e

GB_HOST="http://download.geexbox.org/snapshots"
# Remove white spaces
GB_TYPE=`echo ${CHOICE} | cut -f1 -d':' | tr -d ' '`
GB_DATE=`echo ${CHOICE} | cut -f2 -d':' | tr -d ' '`

curl -L -k ${GB_HOST}/geexbox-${GB_TYPE}-imx6-cuboxi/${GB_DATE}/binaries.cuboxi/ --silent > /tmp/index.html
IMG=`grep "\.img\.xz" /tmp/index.html | cut -f2 -d'"'`
if [ "x$IMG" == "x" ]; then
  echo "Image file is not found at ${GB_HOST}/geexbox-${GB_TYPE}-imx6-cuboxi/${GB_DATE}/binaries.cuboxi/"
  exit -1
fi
curl -L -k ${GB_HOST}/geexbox-${GB_TYPE}-imx6-cuboxi/${GB_DATE}/binaries.cuboxi/$IMG --progress > /tmp/geexbox.img.xz
xzcat -c /tmp/geexbox.img.xz | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
