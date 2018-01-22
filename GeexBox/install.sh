#!/bin/bash
set -e

GB_HOST="http://download.geexbox.org"

# Prepare args
GB_TYPE=$(echo "${CHOICE}" | cut -f1 -d' ' | tr -d ':')
GB_DATE=$(echo "${CHOICE}" | cut -f2 -d' ' | tr -d ':')

if [ -z "$GB_TYPE" ] || [ -z "$GB_DATE" ]; then
  echo "Invalid parameters ${CHOICE}"
  exit -1
fi

rm -f /tmp/index.html /tmp/make-sdcard

if [ "$GB_TYPE" = "next" ]; then
  GB_URLPATH="${GB_HOST}/experiments/geexbox-kodi-imx6-cuboxi/binaries.cuboxi/"
elif [ "$GB_TYPE" = "prev" ]; then
  GB_URLPATH="${GB_HOST}/archives/prev/geexbox-kodi-imx6-cuboxi/${GB_DATE}/"
else
  GB_URLPATH="${GB_HOST}/snapshots/geexbox-${GB_TYPE}-imx6-cuboxi/${GB_DATE}/binaries.cuboxi/"
fi
 
curl -L -k ${GB_URLPATH}make-sdcard --silent -o /tmp/make-sdcard
if chmod +x /tmp/make-sdcard; then
  curl -L -k ${GB_URLPATH} --silent -o /tmp/index.html
  IMG=$(grep "\.tar\.xz" /tmp/index.html | cut -f2 -d'"')
else
  curl -L -k ${GB_URLPATH} --silent -o /tmp/index.html
  IMG=$(grep "\.img\.xz" /tmp/index.html | cut -f2 -d'"')
fi

if [ "x$IMG" == "x" ]; then
  echo "Image file was not found at ${GB_URLPATH}"
  exit -1
fi

curl -L -k ${GB_URLPATH}${IMG} --progress -o /tmp/${IMG}

if [ -e /tmp/make-sdcard ]; then
  echo -e "y\n" | /tmp/make-sdcard /dev/mmcblk0 /tmp/${IMG} cuboxi
else
  xzcat -c /tmp/${IMG} | dd of=/dev/mmcblk0 bs=1M conv=fsync
fi

sync
