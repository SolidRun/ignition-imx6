#!/bin/bash -e

MMCDEV=/dev/mmcblk0
MNTP=/mnt
ARCHIVE=http://files.jm0.eu/debian/mxchrome.tar.xz

# create new partition table with 1 partition
fdisk $MMCDEV << EOF                                                                                                                                                                 
o                                                                                                                                                                                   
n                                                                                                                                                                                   
p                                                                                                                                                                                   
1                                                                                                                                                                                   
                                                                                                                                                                                    
                                                                                                                                                                                    
w                                                                                                                                                                                   
q                                                                                                                                                                                   
EOF

# format partition as ext4
mkfs.ext4 -L rootfs ${MMCDEV}p1

# mount filesystem
mount ${MMCDEV}p1 $MNTP

# download operating system and unpack to sdcard
curl -L -k $ARCHIVE --progress | tar -C $MNTP -xJf -

# install bootloader
dd if=$MNTP/boot/cubox-i-spl.bin of=$MMCDEV bs=1K seek=1
dd if=$MNTP/boot/u-boot.img of=$MMCDEV bs=1K seek=42

# finish all writes
sync

# umount
umount $MNTP

# DONE
