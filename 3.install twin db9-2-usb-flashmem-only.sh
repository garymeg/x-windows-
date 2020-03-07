#!/bin/sh
# Install DB9-2-USB controller

mount /dev/sda2 /media/usb2
cat /media/usb/db92usb.txt >>/nmt/nandb/usr/share/the64/ui/data/gamecontrollerdb.txt
echo "All Done"

