#!/bin/bash
set -e
echo "Downloading"
curl -L -k http://humbo.fatdog.eu/files/install/humbo-slackware-install_BETA_02Nov14_fd.img.xz --progress | unxz | dd of=/dev/mmcblk0 bs=1M
sync
