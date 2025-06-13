#!/bin/bash

enable_optimus() {
echo -e "\e[1;32m""nvidia-legacy-optimus-enabled""\e[0m"
cp -f /opt/nvidia-legacy-optimus/nvidia-legacy-optimus-outputclass.conf \
 /etc/X11/xorg.conf.d/ 2> /dev/null
cp -f /opt/nvidia-legacy-optimus/nvidia-legacy-optimus-xrandr.sh \
 /var/opt/nvidia-legacy-optimus-xrandr.sh 2> /dev/null
chmod +x /var/opt/nvidia-legacy-optimus-xrandr.sh
exit 0
}

disable_optimus() {
rm -f /etc/X11/xorg.conf.d/nvidia-legacy-optimus-outputclass.conf
rm -f /var/opt/nvidia-legacy-optimus-xrandr.sh
exit 0
}

egrep -qe "nv340|nv390" /mnt/live/tmp/modules || disable_optimus

grep -q i915 /proc/modules || disable_optimus

grep -q nv390 /mnt/live/tmp/modules && enable_optimus

if uname -r | grep -q '^5.10'
then enable_optimus
else disable_optimus
fi
