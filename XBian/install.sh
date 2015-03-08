#!/bin/bash
set -e
curl -L -k "http://downloads.sourceforge.net/project/xbian/release/XBian_Latest_imx6.img.gz?r=http%3A%2F%2Fwww.xbian.org%2Fgetxbian%2F&ts=1425802320&use_mirror=waia" --progress | gunzip | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
