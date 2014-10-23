#!/bin/bash
set -e
curl -L -k "http://downloads.sourceforge.net/project/xbian/release/XBian_2014.05.26_CuBox-i.img.gz?r=http%3A%2F%2Fwww.xbian.org%2Fgetxbian%2F&ts=1414096077&use_mirror=garr" --progress | gunzip | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
