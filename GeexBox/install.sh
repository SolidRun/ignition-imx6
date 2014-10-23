#!/bin/bash
set -e
# Remove white spaces
CHOICE_NEW=`echo ${CHOICE} | tr -d ' '`
curl -L -k http://download.geexbox.org/snapshots/geexbox-xbmc-imx6-cuboxi/${CHOICE_NEW}/binaries.cuboxi/ --silent > /tmp/index.html
IMG=`cat /tmp/index.html | grep img.xz | cut -f2 -d'"'`
if [ "x$IMG" == "x" ]; then
	echo "Image file is not found at http://download.geexbox.org/snapshots/geexbox-xbmc-imx6-cuboxi/${CHOICE_NEW}/binaries.cuboxi/"
	exit -1
fi
curl -L -k http://download.geexbox.org/snapshots/geexbox-xbmc-imx6-cuboxi/${CHOICE_NEW}/binaries.cuboxi/$IMG --progress > /tmp/geexbox.img.xz
xzcat -c /tmp/geexbox.img.xz | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
