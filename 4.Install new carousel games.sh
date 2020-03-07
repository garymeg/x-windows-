#!/bin/sh
# File to Make Patition 2 on usbstick hold games and system files
# 
# Copy the system files to mount the USB

cp -r /media/usb/CarouselGames/games/ /media/usb2/usr/share/the64/
cp -r /media/usb/menu.wav /media/usb2/usr/share/the64/ui/sounds/
echo Games added......