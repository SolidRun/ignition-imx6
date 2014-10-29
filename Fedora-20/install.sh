#!/bin/bash
set -e
echo "Downloading and flashing Fedora 20"
# Below the --progrss will emit percentage that can be used by the gui to show progress bar
# the bs=1M is critical since it writes much more efficnient to the micro SD
# Flash the full image
curl -L -k https://googledrive.com/host/0B0vm64JM4bFZMjFNTGJBT1ozWjg --progress | unxz | dd of=/dev/mmcblk0 bs=1M conv=fsync
if [ "x$RESIZE" == "xtrue" ]; then
	echo -e "d\n3\nn\np\n3\n\n\nw\n" | fdisk /dev/mmcblk0
	e2fsck -f /dev/mmcblk0p3
	resize2fs /dev/mmcblk0p3
fi
sync
