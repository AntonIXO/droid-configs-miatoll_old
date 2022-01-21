#/bin/sh

losetup -r /dev/loop0 /dev/sda17
dmsetup create --concise "$(parse-android-dynparts /dev/loop0)"
mkdir -p /system_root /dsp /persist /bt_firmware /firmware /metadata
mount -o ro,barrier=1,discard  /dev/mapper/dynpart-system  /system_root
mount -o bind /system_root/system /system
mount -o ro,barrier=1,discard /dev/mapper/dynpart-product  /product
mount -o ro,barrier=1,discard /dev/mapper/dynpart-system_ext /system/system_ext
mount -o ro,barrier=1,discard /dev/mapper/dynpart-vendor  /vendor
mount -o ro,nosuid,nodev,barrier=1  /dev/sde9                      /vendor/dsp
mount        /dev/sde4       /vendor/firmware_mnt
mount -o ro  /dev/sde5       /vendor/bt_firmware
mount        /dev/sda2       /persist
mount        /dev/sda12      /metadata
mount -o bind /vendor/firmware_mnt /firmware
mount -o bind /vendor/firmware_mnt /vendor/rfs/msm/mpss/readonly/vendor/firmware_mnt/
mount -o bind /vendor/bt_firmware /bt_firmware
mount -o bind /vendor/dsp /dsp
mount -o bind /vendor /system_root/vendor
mount -o bind /system_ext /system_root/system_ext
mount -o bind /product /system_root/product
mount -o bind /odm /system_root/odm
ln -s /system_ext/lib64/libdpmframework.so /odm/lib64/libdpmframework.so
ln -s /system_ext/lib64/libdiag_system.so /odm/lib64/libdiag_system.so
ln -s /system_ext/lib64/vendor.qti.diaghal@1.0.so /odm/lib64/vendor.qti.diaghal@1.0.so
mount --bind /etc/audio_policy_configuration.xml /vendor/etc/audio_policy_configuration.xml
mount --bind /etc/codec2.vendor.base.policy /vendor/etc/seccomp_policy/codec2.vendor.base.policy
mount --bind /usr/bin/libexec/droid-hybris/system/lib/android.hardware.sensors@1.0.so /apex/com.android.vndk.current/lib/android.hardware.sensors@1.0.so
mount --bind /usr/bin/libexec/droid-hybris/system/lib64/android.hardware.sensors@1.0.so /apex/com.android.vndk.current/lib64/android.hardware.sensors@1.0.so
mount --bind /usr/bin/libexec/droid-hybris/system/lib64/android.hardware.sensors@1.0.so /system/lib64/android.hardware.sensors@1.0.so
mount --bind /usr/bin/libexec/droid-hybris/system/lib/android.hardware.sensors@1.0.so /system/lib/android.hardware.sensors@1.0.so
export ADSP_LIBRARY_PATH="/vendor/etc/camera/libsnpe_dsp_v66_domains_v2_skel.so;/system/lib/rfsa/adsp;/system/vendor/lib/rfsa/adsp;/dsp"
set ADSP_LIBRARY_PATH="/vendor/etc/camera/libsnpe_dsp_v66_domains_v2_skel.so;/system/lib/rfsa/adsp;/system/vendor/lib/rfsa/adsp;/dsp"

mkdir /dev/stune
mkdir -p /dev/stune/background /dev/stune/foreground /dev/stune/nnapi-hal /dev/stune/top-app /dev/stune/rt
touch /dev/stune/background/cgroup.clone_children
touch /dev/stune/background/cgroup.procs
touch /dev/stune/background/notify_on_release
touch /dev/stune/background/schedtune.boost
touch /dev/stune/background/schedtune.prefer_high_cap
touch /dev/stune/background/schedtune.prefer_idle
touch /dev/stune/background/tasks

touch /dev/stune/foreground/cgroup.clone_children
touch /dev/stune/foreground/cgroup.procs
touch /dev/stune/foreground/notify_on_release
touch /dev/stune/foreground/schedtune.boost
touch /dev/stune/foreground/schedtune.prefer_high_cap
touch /dev/stune/foreground/schedtune.prefer_idle
touch /dev/stune/foreground/tasks

touch /dev/stune/nnapi-hal/cgroup.clone_children
touch /dev/stune/nnapi-hal/cgroup.procs
touch /dev/stune/nnapi-hal/notify_on_release
touch /dev/stune/nnapi-hal/schedtune.boost
touch /dev/stune/nnapi-hal/schedtune.prefer_high_cap
touch /dev/stune/nnapi-hal/schedtune.prefer_idle
touch /dev/stune/nnapi-hal/tasks

touch /dev/stune/top-app/cgroup.clone_children
touch /dev/stune/top-app/cgroup.procs
touch /dev/stune/top-app/notify_on_release
touch /dev/stune/top-app/schedtune.boost
touch /dev/stune/top-app/schedtune.prefer_high_cap
touch /dev/stune/top-app/schedtune.prefer_idle
touch /dev/stune/top-app/tasks

touch /dev/stune/rt/cgroup.clone_children
touch /dev/stune/rt/cgroup.procs
touch /dev/stune/rt/notify_on_release
touch /dev/stune/rt/schedtune.boost
touch /dev/stune/rt/schedtune.prefer_high_cap
touch /dev/stune/rt/schedtune.prefer_idle
touch /dev/stune/rt/tasks

touch /dev/stune/cgroup.clone_children
touch /dev/stune/cgroup.sane_behavior
touch /dev/stune/cgroup.procs
touch /dev/stune/notify_on_release
touch /dev/stune/schedtune.boost
touch /dev/stune/schedtune.prefer_high_cap
touch /dev/stune/schedtune.prefer_idle
touch /dev/stune/tasks

chmod 664 /dev/stune/tasks
chmod 664 /dev/stune/*/tasks

