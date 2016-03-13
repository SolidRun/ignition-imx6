#!/bin/bash
set -e
echo "Downloading"
DIST_NAME=Armbian_5.00_Cubox-i_Debian_jessie_3.14.60_desktop
curl -L -k http://mirror.igorpecovnik.com/${DIST_NAME}.zip --progress > /tmp/deb.zip
echo "Flashing"
echo "### 70.0%"
unzip /tmp/deb.zip ${DIST_NAME}.raw -p | dd of=/dev/mmcblk0 bs=1M conv=fsync
echo "### 100%"
sync
