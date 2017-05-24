#!/bin/bash
set -e
# Remove white spaces
curl -L -k "http://updates.volumio.org/cuboxi/volumio/2.129/volumio-2.129-2017-03-26-cuboxi.img.zip" --progress > /tmp/volumio.zip
cd /tmp
unzip volumio.zip volumio-2.129-2017-03-26-cubox.img -p | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
