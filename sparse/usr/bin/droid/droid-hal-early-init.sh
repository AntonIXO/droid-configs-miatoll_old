#/bin/sh

# Mount super.img partitions using parse-android-dynparts.
losetup -r /dev/loop0 /dev/sda17
dmsetup create --concise "$(parse-android-dynparts /dev/loop0)"
mkdir -p /system_root /dsp /persist /bt_firmware /firmware /metadata
mount -o ro,barrier=1,discard  /dev/mapper/dynpart-system  /system_root
mount -o bind /system_root/system /system
mount -o ro,barrier=1,discard /dev/mapper/dynpart-product  /product
mount -o ro,barrier=1,discard /dev/mapper/dynpart-system_ext /system/system_ext
mount -o ro,barrier=1,discard /dev/mapper/dynpart-vendor  /vendor
# Others partitions mounting.
mount -o ro,nosuid,nodev,barrier=1  /dev/sde9                      /vendor/dsp
mount        /dev/sde4       /vendor/firmware_mnt
mount -o ro  /dev/sde5       /vendor/bt_firmware
mount        /dev/sda2       /persist
mount        /dev/sda12      /metadata
# Binding mountpoints to sailfish used directories.
mount -o bind /vendor/firmware_mnt /firmware
mount -o bind /vendor/firmware_mnt /vendor/rfs/msm/mpss/readonly/vendor/firmware_mnt/
mount -o bind /vendor/bt_firmware /bt_firmware
mount -o bind /vendor/dsp /dsp
mount -o bind /vendor /system_root/vendor
mount -o bind /system_ext /system_root/system_ext
mount -o bind /product /system_root/product
mount -o bind /odm /system_root/odm
# Link not founded files.
ln -s /system_ext/lib64/libdpmframework.so /odm/lib64/libdpmframework.so
ln -s /system_ext/lib64/libdiag_system.so /odm/lib64/libdiag_system.so
ln -s /system_ext/lib64/vendor.qti.diaghal@1.0.so /odm/lib64/vendor.qti.diaghal@1.0.so
# Sound fix.
mount --bind /etc/audio_policy_configuration.xml /vendor/etc/audio_policy_configuration.xml
# Fixed jail properties for HW codecs.
mount --bind /etc/codec2.vendor.base.policy /vendor/etc/seccomp_policy/codec2.vendor.base.policy
# Fix modules directory.
mv /lib/modules/* /lib/modules/$(uname -r)

# Fix stune errors
sh /usr/bin/droid/stune-fix.sh

