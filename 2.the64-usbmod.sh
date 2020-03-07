#!/bin/sh
# File to Make Patition 2 on usbstick hold games and system files
# 
# Copy the system files to mount the USB
echo Setting up system
cp  -v /media/usb/fstab /mnt/nandb/etc/
cp  -v /media/usb/S98mountusb /mnt/nandb/etc/init.d/
cp  -v /media/usb/the64 /mnt/nandb/usr/bin/

# make mount points
if [ ! -d /mnt/nandb/mnt ]
then
	mkdir /mnt/nandb/mnt
fi
if [ ! -d /mnt/nandb/mnt2 ]
then
mkdir /mnt/nandb/mnt2
fi
if [ ! -d /mnt/nandb/mnt3 ]
then
mkdir /mnt/nandb/mnt3
fi
#mount the drive
mount -o rw /dev/sda2 /media/usb2

# Copy the default games to usb partition2
if [ ! -d /media/usb2/usr/ ]
then
mkdir /media/usb2/usr/
fi
if [ ! -d /media/usb2/usr/share/ ]
then
mkdir /media/usb2/usr/share/
fi
if [ ! -d /media/usb2/var/ ]
then
mkdir /media/usb2/var/
fi
if [ ! -d /media/usb2/var/lib/ ]
then
mkdir /media/usb2/var/lib/
fi
echo Now copying files to usb disk
echo Please wait..........

cp -r /mnt/nandb/usr/share/the64/ /media/usb2/usr/share
cp -r /mnt/nandb/var/lib/the64/ /media/usb2/var/lib


echo All done Please reboot to use the USB now
