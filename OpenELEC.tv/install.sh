#!/bin/bash
set -e
echo "Downloading"
curl -L -k http://releases.openelec.tv/OpenELEC-imx6.arm-6.0.1.tar --progress > /tmp/oe.tar
mkdir -p /tmp/oe
cd /tmp/oe
# Untar and remove the leading directory name
tar --strip-components=1 -xf /tmp/oe.tar
rm /tmp/oe.tar
./create_sdcard /dev/mmcblk0
sync
