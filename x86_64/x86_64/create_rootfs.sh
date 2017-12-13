ARCH="x86_64"
ROOTDIR="$PWD"
ROOTFS="rootfs"
FSTYPE=ext3
FSFILE=rootfs.$FSTYPE
BUSYBOX="$HOME/qemu/busybox-1.27.2/build/"
MNTDIR="mnt"

echo "PWD $PWD"
echo "MNTDIR $MNTDIR"
echo "FSTYPE $FSTYPE"
echo "FSFILE $FSFILE"
echo "ROOTFS $ROOTFS"
echo "ROOTDIR $ROOTDIR"
echo "BUSYBOX $BUSYBOX"

rm -rf $ROOTFS

mkdir $MNTDIR
mkdir $ROOTFS

cp -r $BUSYBOX/$ARCH/_install/* $ROOTFS
cd $ROOTFS && echo $PWD
mkdir lib dev/pts proc bin sbin sysfs usr/bin usr/sbin etc/init.d -p
cd dev && echo $PWD
mknod -m 666 tty1 c 4 1
mknod -m 666 tty2 c 4 2
mknod -m 666 tty3 c 4 3
mknod -m 666 tty4 c 4 4
mknod -m 666 null c 1 3
mknod -m 666 console c 5 1

# change to rootdir
cd $ROOTDIR && echo $PWD
dd if=/dev/zero of=$FSFILE bs=1M count=32
mkfs.$FSTYPE $FSFILE
mount -t $FSTYPE $FSFILE $MNTDIR -o loop
cp -r $ROOTDIR/$ROOTFS/* $MNTDIR
umount $MNTDIR

#sh $ROOTDIR/overroot.sh
#mount -t ext3 -o loop rootfs.ext3 mnt/
#cp arm-rootfs/* mnt/ -r
#umount mnt
