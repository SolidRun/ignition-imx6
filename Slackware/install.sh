#!/bin/bash
set -e
echo "Downloading"
curl -L -k http://humbo.fatdog.eu/files/install/humbo-slackwarearm-installer_latest_fd.img.xz --progress | unxz | dd of=/dev/mmcblk0 bs=1M
sync
