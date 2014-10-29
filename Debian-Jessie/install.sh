#!/bin/bash
set -e
echo "Downloading"
#curl -L -k http://download.solid-run.com/pub/solidrun/cubox-i/Debian/Jessi-repackaged-trial/debian-jessi-4-july-2014.img.xz --progress | unxz | dd of=/dev/mmcblk0 bs=1M
if [ "x$RESIZE" == "xtrue" ]; then
	echo -e "d\n2\nn\np\n2\n\n\nw\n" | fdisk /dev/mmcblk0
	/usr/sbin/e2fsck -f /dev/mmcblk0p2 || true
	/usr/sbin/resize2fs /dev/mmcblk0p2 || true
fi
sync
