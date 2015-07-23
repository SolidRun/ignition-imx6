#!/bin/bash
set -e
curl -L -k http://www.mirrorservice.org/sites/ftp.redsleeve.org/pub/el6/rootfs/rsel6-cuboxi-latest.img.xz --progress | unxz | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
