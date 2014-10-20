#!/bin/bash
set -e
echo "Downloading"
curl -L -k http://cubie.nobrainz.de/downloads/Cubox-i_Debian_2.0_wheezy.zip --progress > /tmp/deb.zip
echo "Flashing"
echo "### 70.0%"
unzip /tmp/deb.zip Cubox-i_Debian_2.0_wheezy.raw -p | dd of=/dev/mmcblk0 bs=1M conv=fsync
echo "### 100%"
sync
