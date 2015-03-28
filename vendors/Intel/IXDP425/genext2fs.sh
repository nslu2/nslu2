#!/bin/sh

if [ $# -ne 3 ]
then
	echo "Usage: $0 size source dest"
	exit 1
fi
MNTPOINT=/mnt/dongle
mkdir -p $MNTPOINT

dd if=/dev/zero of=$3 bs=1k count=$1 2> /dev/null
echo y | /sbin/mke2fs -m 1 -q $3 $1 &> /dev/null

mkdir -p $MNTPOINT

mount -o loop -t ext2 $3 $MNTPOINT

(cd $2; find . | cpio --quiet -pud $MNTPOINT)

df $MNTPOINT | tail +2
umount $MNTPOINT
#gzip -9 < $IMG1DIR/$IMAGE.nogz > $IMG1DIR/$IMAGE
