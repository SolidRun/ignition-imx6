#!/bin/bash
set -e
# Remove white spaces
if [ "x$E17" == "xtrue" ]; then
	IMG=http://files.jm0.eu/suse/openSUSE-13.1-ARM-E17-cuboxi.armv7l-1.12.1-Build68.2.raw.xz
elif [ "x$XFCE" == "xtrue" ]; then
	IMG=http://files.jm0.eu/suse/openSUSE-13.1-ARM-XFCE-cuboxi.armv7l-1.12.1-Build68.2.raw.xz
else
	IMG=http://files.jm0.eu/suse/openSUSE-13.1-ARM-JeOS-cuboxi.armv7l-1.12.1-Build68.2.raw.xz
fi
curl -L -k $IMG --progress | unxz | dd of=/dev/mmcblk0 bs=1M
sync
