#!/bin/bash
set -e
# Remove white spaces
if [ "x$E17" == "xtrue" ]; then
	IMG=http://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/IMX6/images/openSUSE-Tumbleweed-ARM-E17-cuboxi.armv7l.raw.xz
elif [ "x$XFCE" == "xtrue" ]; then
	IMG=http://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/IMX6/images/openSUSE-Tumbleweed-ARM-XFCE-cuboxi.armv7l.raw.xz
else
	IMG=http://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/IMX6/images/openSUSE-Tumbleweed-ARM-JeOS-cuboxi.armv7l.raw.xz
fi
curl -L -k $IMG --progress | unxz | dd of=/dev/mmcblk0 bs=4M
sync
