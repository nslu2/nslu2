============ NSLU2 source codes ==========================================
NSLU2_V23R63_GPL.tgz
   -----------------------------------------------------------------------------------------
   Folder/File         							Description                   
   -----------------------  					------------------------------------------------
   NSLU2_V23R63_GPL/toolchain					Toolchain for Applications and Linux Kernel
   NSLU2_V23R63_GPL/linux-2.4.x					Linux Kernel
   NSLU2_V23R63_GPL/Readme.txt		   			Readme
   NSLU2_V23R63_GPL/redboot		   				Source code of Boot Loader
   NSLU2_V23R63_GPL/glibc			   			Source code of glibc
   NSLU2_V23R63_GPL/user			   			Source of applications.
   NSLU2_V23R63_GPL/romfs.tgz		   			Basic files for creating Ramdisk.
   NSLU2_V23R63_GPL/Makefile       				A makefile to build "Linux Kernel" and "Applications" 
   NSLU2_V23R63_GPL/images		     			Binaries of "Loader", "Linux Kernel" and "File System" are put here.

============ NSLU2 FW binary (NSLU2_V23R63.bin) build procedure ===========
1. Install NSLU2 source codes and change to the source code folder
   Un-tar "NSLU2_V23R63_GPL.tgz" to a source code folder.
   change to the source code folder.

2. Install Toolchains
   #tar -xvzf toolchain/arm-linux.tgz -C /usr/local/
   #export PATH=$PATH:/usr/local/bin/  
   	
2. Build F/W binrary
   #make clean 
   #make dep
   #./mklinks.sh
   #make all
   #cd images
   #./bb
   #mv linux.bin NSLU2_V23R63.bin	
   images/NSLU2_V23R63.bin is the F/W binary.

3. Build the Boot Loader (If necessary)
	#cd redboot
	#make 
	redboot.bin is the new boot loader.
	
4. Build the toolchains  (If necessary)
	#cd Build
	#cd binutils-2.13.2
	#./build_all.sh
	#cd ../gcc-3.2.1
	#./build_all.sh
	
