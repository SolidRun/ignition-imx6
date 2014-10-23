#!/bin/bash
set -e
# Remove white spaces
curl -L -k "http://downloads.sourceforge.net/project/volumio/Cubox-i/1.4/Volumio1.4Cubox-i.zip?r=http%3A%2F%2Fvolumio.org%2Fget-started%2F&ts=1414097360&use_mirror=garr" --progress > /tmp/volumio.zip
cd /tmp
unzip volumio.zip Volumio1.4Cubox-i.img -p | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
