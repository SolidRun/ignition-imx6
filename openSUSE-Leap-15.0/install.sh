#!/bin/bash
set -e
# Remove white spaces
if [ "x$E20" == "xtrue" ]; then
	IMG=http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-E20-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
elif [ "x$XFCE" == "xtrue" ]; then
	IMG=http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-XFCE-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
elif [ "x$LXQt" == "xtrue" ]; then
	IMG=http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-LXQT-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
elif [ "x$KDE" == "xtrue" ]; then
	IMG=http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-KDE-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
else
	IMG=http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-JeOS-efi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
fi
curl -L -k $IMG --progress | unxz | dd of=/dev/mmcblk0 bs=4M iflag=fullblock oflag=direct
sync
