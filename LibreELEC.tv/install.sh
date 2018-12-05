#!/bin/bash
set -e

IMG=$(wget -q https://libreelec.tv/downloads/cubox-i2-i4-hummingboard/ -O - | grep -oh '<a href=.*.img.gz">' | cut -f2 -d'"')

echo "Downloading and installing"
curl -L -k ${IMG} --progress | gunzip | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
