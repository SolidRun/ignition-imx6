#!/bin/bash
set -e
echo "Downloading and flashing Android AOSPBox-i R1.4"
# Below the --progrss will emit percentage that can be used by the gui to show progress bar
# the bs=1M is critical since it writes much more efficnient to the micro SD
curl -L -k http://netcologne.dl.sourceforge.net/project/aospboxi/cuboxi_AOSPBox-i_R1.4.img.xz --progress | unxz | dd of=/dev/mmcblk0 bs=1M conv=fsync
sync
