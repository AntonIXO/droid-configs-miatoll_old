#/bin/bash

losetup -r /dev/loop0 /dev/sda17
dmsetup create --concise "$(parse-android-dynparts /dev/loop0)"
mkdir /system_root
mount -o ro,barrier=1,discard  /dev/mapper/dynpart-system  /system_root
mount -o bind /system_root/system /system
mount -o ro,barrier=1,discard /dev/mapper/dynpart-product  /product
mount -o ro,barrier=1,discard /dev/mapper/dynpart-system_ext /system/system_ext
mount -o ro,barrier=1,discard /dev/mapper/dynpart-vendor  /vendor
mount -o ro,nosuid,nodev,barrier=1  /dev/sde9                      /vendor/dsp
mount -o ro  /dev/sde5       /vendor/bt_firmware
mount -o bind /vendor /system_root/vendor
mount -o bind /system_ext /system_root/system_ext
mount -o bind /product /system_root/product
mount -o bind /odm /system_root/odm
ln -s /odm/lib/libandroidicu.so /system/lib/
ln -s /odm/lib64/libandroidicu.so /system/lib64/

