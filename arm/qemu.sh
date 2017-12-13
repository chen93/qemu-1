qemu-system-arm \
    -kernel zImage \
    -dtb vexpress-v2p-ca9.dtb \
    -m 512M \
    -M vexpress-a9 \
    -append "root=/dev/mmcblk0 console=ttyAMA0" \
    -sd rootfs.ext3 \
    -nographic

