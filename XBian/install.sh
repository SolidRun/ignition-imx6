#!/bin/bash
set -e
curl -L -k "http://sourceforge.net/projects/xbian/files/release/XBian_2015.12.06_imx6.img.gz/download" --progress | gunzip | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
