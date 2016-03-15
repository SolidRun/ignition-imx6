#!/bin/bash

# configure busybox so pipes fail if either element fails
set -o pipefail

# try to download and flash image, and collect exist status
curl -L -k "https://sourceforge.net/projects/xbian/files/release/XBian_Latest_imx6.img/download" --progress | gunzip | dd of=/dev/mmcblk0 bs=1M conv=fsync
s=$?

# return exit status of download/flashing
exit $s
