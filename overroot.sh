mount -t ext3 -o loop rootfs.ext3 mnt/
cp arm-rootfs/* mnt/ -r
umount mnt
