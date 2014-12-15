#!/bin/bash
set -e
echo "Downloading and flashing android on the go"
# Below the --progrss will emit percentage that can be used by the gui to show progress bar
# the bs=1M is critical since it writes much more efficnient to the micro SD
curl https://server.vijge.net/static/cubox/android/android-4.4.2-1.0.1c-ga-aaf118bb78-gapps.img.xz --progress | unxz | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
