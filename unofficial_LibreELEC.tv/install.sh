#!/bin/bash
set -e
echo "Downloading and installing"
curl -L -k https://github.com/udK/LibreELEC.tv/releases/download/20160404/LibreELEC-imx6.arm-7.0-devel-20160404160617-r22522-gb0ac12e.img.gz --progress | gunzip | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
