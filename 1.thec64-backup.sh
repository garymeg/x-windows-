#!/bin/sh
# Expects the model parameter from the updater as first argument ($THEC64MODEL)
# Create initial directory for backups in case it doesn't exist
mkdir -p /media/usb/backup/$THEC64MODEL

# Determine what the next backup number is
cd /media/usb/backup/$THEC64MODEL
NEXTNUM=$(expr `find . -regex './nand.[0-9][0-9][0-9]$' -print | sort | tail -n 1 | sed 's/\.\/nand\.//'` + 1 | awk '{printf "%03d",  $THEC64MODEL}')
if [ "x$NEXTNUM" = "x" ]; then NEXTNUM=000; fi

mkdir -p /media/usb/backup/$THEC64MODEL/nand.$NEXTNUM
mkdir -p /media/usb/backup/$THEC64MODEL/files.$NEXTNUM

# Copy nanda and nandb
echo Backing up nanda and nandb
cp -v /dev/nand? /media/usb/backup/$THEC64MODEL/nand.$NEXTNUM

# Copy the64 files
echo Backing up the64 files
cp -rv /media/the64 /media/usb/backup/$THEC64MODEL/files.$NEXTNUM
