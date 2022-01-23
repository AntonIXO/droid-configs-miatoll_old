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
