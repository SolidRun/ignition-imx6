#!/bin/bash
set -e
dd if=/dev/zero of=/dev/mmcblk0 bs=1M count=4
echo -e "n\np\n1\n\n\nw\n" | fdisk /dev/mmcblk0
mkfs.ext4 /dev/mmcblk0p1
mount /dev/mmcblk0p1 /mnt
cd /mnt
curl -L -k http://archlinuxarm.org/os/ArchLinuxARM-imx6-cubox-latest.tar.gz --progress | tar -zxf -
dd if=boot/SPL of=/dev/mmcblk0 bs=1K seek=1
dd if=boot/u-boot.img of=/dev/mmcblk0 bs=1K seek=69
cd /
umount /mnt
sync
