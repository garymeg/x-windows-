#!/bin/sh

# Kill the64 to save memory
killall the64
killall the64

# Make rootfs and USB drive rw
mount -o remount,rw /
mount -o remount,rw /mnt

mkdir /tmp/chroot

# Image is mounted read-only to prevent corruption
mount -o ro /mnt/rootfs.img /tmp/chroot

mount -t proc proc /tmp/chroot/proc
mount -t devtmpfs devtmpfs /tmp/chroot/dev
mount -t devpts devpts /tmp/chroot/dev/pts
mount -t tmpfs tmpfs /tmp/chroot/dev/shm
mount -t tmpfs tmpfs /tmp/chroot/tmp
mkdir -p /tmp/log
mount --bind /tmp/log /tmp/chroot/var/log
mount --bind /sys /tmp/chroot/sys
mount --bind /run /tmp/chroot/run
mount --bind /mnt /tmp/chroot/media/usb

mkdir -p /tmp/chroot/mnt/nandb
mount /dev/nandb /tmp/chroot/mnt/nandb
mkdir -p /tmp/chroot/media/the64
mount --bind /tmp/chroot/mnt/nandb/usr/share/the64 /tmp/chroot/media/the64

# Kill the64 some more just to be sure
killall the64
killall the64

THEC64MODEL=$1 XAUTHORITY=/tmp/.Xauthority HOME=/home/olimex chroot /tmp/chroot startx

umount /tmp/chroot/media/the64
umount /tmp/chroot/mnt/nandb
umount /tmp/chroot/proc
umount /tmp/chroot/dev/pts
umount /tmp/chroot/dev/shm
umount /tmp/chroot/var/log
umount /tmp/chroot/tmp
umount /tmp/chroot/sys
umount /tmp/chroot/run
umount /tmp/chroot/dev
umount /tmp/chroot/media/usb
sync
sleep 3
umount /tmp/chroot

cd /
the64 &
