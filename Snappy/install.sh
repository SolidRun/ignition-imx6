#!/bin/bash
set -e
echo "Downloading and flashing snappy develop channel on the go"
curl -L -k https://github.com/dz0ny/snappy-cubox-i/releases/download/v0.0.3/cubox-snappy.img.xz --progress | unxz | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
