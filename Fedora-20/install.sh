#!/bin/bash
set -e
echo "Downloading and flashing Fedora 20"
# Below the --progrss will emit percentage that can be used by the gui to show progress bar at 100%
# while dd writes slowly to mmc.  If you want progress, kill -USR1 ${pid of dd} will send status to stderr...
#             18335302+0  records  in  18335302+0 records out 9387674624 bytes
#             (9.4 GB) copied, 34.6279 seconds, 271 MB/s
# would require a text widjet instead of a progress bar.
# the bs=1M is critical since it writes much more efficnient to the micro SD
# Flash the full image
curl -L -k https://googledrive.com/host/0B0vm64JM4bFZMjFNTGJBT1ozWjg --progress | unxz | dd of=/dev/mmcblk0 bs=1M conv=fsync
if [ "x$RESIZE" == "xtrue" ]; then
	partx --show /dev/mmcblk0 2>/dev/null | while read NR START END; do : ; done
        echo -e "d\n${NR}\nn\np\n${NR}\n${START}\n\nw\n" | fdisk /dev/mmcblk0
	e2fsck -f /dev/mmcblk0p3
	resize2fs /dev/mmcblk0p3
fi
sync
