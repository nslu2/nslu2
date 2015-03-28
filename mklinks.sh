#!/bin/sh

ROOTDIR=`/bin/pwd`
LINUXDIR=$ROOTDIR/linux-2.4.x

rm -f config.arch IXP400lib
ln -sf vendors/Intel/IXDP425/config.arch config.arch
(cd $ROOTDIR/lib ; rm -f glibc; ln -sf ../glibc glibc)
(cd $LINUXDIR/include ; rm -f asm; ln -sf asm-arm asm ; cd asm ; rm -f arch; ln -sf arch-ixp425 arch ; rm -f proc; ln -sf proc-armv proc)
cd $ROOTDIR/user/samba-3.0.11/source
ln -fs libntpass.so.0.0 libntpass.so.0
ln -fs libntpass.so.0 libntpass.so
cd $ROOTDIR

