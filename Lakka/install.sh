#!/bin/bash
set -e
echo "Downloading"
curl -L -k http://sources.lakka.tv/nightly/${CHOICE} --progress > /tmp/lakka.tar
mkdir -p /tmp/lakka
cd /tmp/lakka
# Untar and remove the leading directory name
tar --strip-components=1 -xf /tmp/lakka.tar
./create_sdcard /dev/mmcblk0
sync
