#!/bin/bash
set -e
# Wipe out MBR
dd if=/dev/zero of=/dev/mmcblk0 bs=1k count=1
echo -e "n\np\n1\n\n\nw\n" | fdisk /dev/mmcblk0
curl -L -k http://mini-distribution.io/prebuilds/hummingboard/latest/SPL | dd of=/dev/mmcblk0 bs=1k seek=1
curl -L -k http://mini-distribution.io/prebuilds/hummingboard/latest/u-boot.img | dd of=/dev/mmcblk0 bs=1k seek=42
mkfs.ext4 /dev/mmcblk0p1
mount /dev/mmcblk0p1 /mnt
cd /mnt
curl -L -k http://mini-distribution.io/prebuilds/hummingboard/latest/fs.tar.xz --progress | unxz | tar -xf -
cd /
umount /mnt
sync
