#!/bin/bash
set -e
# Remove white spaces
if [ "x$E20" == "xtrue" ]; then
	IMG=http://download.opensuse.org/ports/armv7hl/tumbleweed/images/openSUSE-Tumbleweed-ARM-E20-cuboxi.armv7l-Current.raw.xz
elif [ "x$XFCE" == "xtrue" ]; then
	IMG=http://download.opensuse.org/ports/armv7hl/tumbleweed/images/openSUSE-Tumbleweed-ARM-XFCE-cuboxi.armv7l-Current.raw.xz
elif [ "x$LXQt" == "xtrue" ]; then
	IMG=http://download.opensuse.org/ports/armv7hl/tumbleweed/images/openSUSE-Tumbleweed-ARM-LXQT-cuboxi.armv7l-Current.raw.xz
elif [ "x$KDE" == "xtrue" ]; then
	IMG=http://download.opensuse.org/ports/armv7hl/tumbleweed/images/openSUSE-Tumbleweed-ARM-KDE-cuboxi.armv7l-Current.raw.xz
else
	IMG=http://download.opensuse.org/ports/armv7hl/tumbleweed/images/openSUSE-Tumbleweed-ARM-JeOS-cuboxi.armv7l-Current.raw.xz
fi
curl -L -k $IMG --progress | unxz | dd of=/dev/mmcblk0 bs=4M iflag=fullblock oflag=direct
sync
