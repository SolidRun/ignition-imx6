#!/bin/bash
set -e
echo "Downloading and flashing Android AOSPBox-i R1.5.1"
# Below the --progrss will emit percentage that can be used by the gui to show progress bar
# the bs=1M is critical since it writes much more efficnient to the micro SD
curl -L -k http://sourceforge.net/projects/aospboxi/files/cuboxi_AOSPBox-i_R1.5.1.img.xz/download --progress | unxz | dd of=/dev/mmcblk0 bs=1M conv=fsync
if [ "x$RESIZE" == "xtrue" ]; then
	# The sector below 100000 is in order to trick fdisk to allocate from
	# the first available sector after 100000 instead of the beginning
	# of the volume (which is sector 2048 using fdisk tool).
        echo -e "d\n4\nn\np\n100000\n\n\nw\n" | fdisk /dev/mmcblk0
        /usr/sbin/e2fsck -f /dev/mmcblk0p4 || true
        /usr/sbin/resize2fs /dev/mmcblk0p4 || true
fi
sync
