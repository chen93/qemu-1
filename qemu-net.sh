qemu-system-arm \
    -kernel zImage \
    -dtb vexpress-v2p-ca9.dtb \
    -m 512M \
    -M vexpress-a9 \
    -append "root=/dev/mmcblk0 console=ttyAMA0" \
    -sd rootfs.ext3 \
    -net nic,vlan=0 -net tap,vlan=0,ifname=tap0 \
    -nographic -s -S

