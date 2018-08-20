#!/bin/bash
set -e
# Remove white spaces
IMG=http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-LXQT-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
curl -L -k $IMG --progress | unxz | dd of=/dev/mmcblk0 bs=4M iflag=fullblock oflag=direct
sync
