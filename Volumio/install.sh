#!/bin/bash
set -e
# Remove white spaces
curl -L -k "http://sourceforge.net/projects/volumio/files/Cubox-i/1.5/Volumio1.5Cuboxi.img.zip/download" --progress > /tmp/volumio.zip
cd /tmp
unzip volumio.zip Volumio1.5Cuboxi.img -p | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
