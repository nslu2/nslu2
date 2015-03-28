#
#	Makefile -- Build instructions for INTEL/IXPD425 (XSCALE)
#

RAMDISK  = $(IMAGEDIR)/ramdisk
KERNELZ  = $(IMAGEDIR)/zImage
COPY_to_TFTP=n

ROMFS_DIRS = \
	bin \
	dev \
	etc \ # etc/config \
	home home/httpd \
	lib lib/modules \
	mnt \
	proc \
	sbin \
	tmp \
	usr usr/bin usr/sbin \
	var var/lock var/log var/run var/tmp var/empty


clean:

romfs:
	[ -d $(ROMFSDIR)/$$i ] || mkdir -p $(ROMFSDIR)
	for i in $(ROMFS_DIRS); do \
		[ -d $(ROMFSDIR)/$$i ] || mkdir -p $(ROMFSDIR)/$$i; \
	done
#	$(ROMFSINST) /etc/rc
#	$(ROMFSINST) /etc/inittab
#	$(ROMFSINST) ../../Generic/romfs/etc/services /etc/services
#	$(ROMFSINST) /etc/motd
#	$(ROMFSINST) /etc/passwd

	# setup the web pages here
#	$(ROMFSINST) /home/httpd/index.html

	@echo "$(VERSIONSTR) with ixp400 v1.3 -- " `date` > $(ROMFSDIR)/etc/version

image:
#	rm -f $(ROMFSDIR)/lib/modules/2.4.22-xfs/kernel/drivers/ixp400/ixp400_*.o
	[ -d $(IMAGEDIR) ] || mkdir -p $(IMAGEDIR)
	tar xvfz $(ROOTDIR)/romfs.tgz -C $(ROOTDIR)
	./genext2fs.sh 11500 $(ROMFSDIR) $(RAMDISK)
	rm -fr $(ROMFSDIR)
	gzip -9 -f $(RAMDISK)
	cp $(ROOTDIR)/$(LINUXDIR)/arch/arm/boot/zImage $(KERNELZ)
	@echo "+----------------------------------------------------"
	@echo "| Build Complete "
	@echo "|"
	@if [ "$(COPY_TO_TFTP)" = "y" ]; \
	then \
		if [ -d /tftpboot ]; \
		then \
			cp $(KERNELZ) /tftpboot/ 2> /dev/null; \
			cp $(RAMDISK).gz /tftpboot/ 2> /dev/null; \
		fi \
	else \
		echo "| Images are in $(IMAGEDIR) " ; \
		echo "|" ; \
		echo "| As root, copy the images to /tftpboot " ; \
	fi
	@echo "|  Load the images using the RedBoot v1.92  commands: "
	@echo "|"
	@echo "|    load -r -v -b 0x01600000 zImage     "
	@echo "|    load -r -v -b 0x00800000 ramdisk.gz "
	@echo "|    go -n 0x01600000 "
	@echo "|"
	@echo "+-----------------------------------------------------"


