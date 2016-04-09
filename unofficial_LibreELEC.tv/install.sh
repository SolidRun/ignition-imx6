#!/bin/bash
set -e
echo "Downloading and installing"
curl -L -k https://github.com/udK/LibreELEC.tv/releases/download/20160408/LibreELEC-imx6.arm-7.0-devel-20160408203343-r22628-g932cfda.img.gz --progress | gunzip | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
