#!/bin/bash

if egrep -qe "nv340|nv390" /mnt/live/tmp/modules; then
  if grep -q i915 /proc/modules; then
  echo -e "\033[1;32m""nvidia-legacy-optimus-enabled""\033[0m"

  cp -f /opt/nvidia-legacy-optimus/nvidia-legacy-optimus-outputclass.conf \
  /etc/X11/xorg.conf.d/ 2> /dev/null

  cp -f /opt/nvidia-legacy-optimus/nvidia-legacy-optimus-xrandr.sh \
  /var/opt/nvidia-legacy-optimus-xrandr.sh 2> /dev/null
  chmod +x /var/opt/nvidia-legacy-optimus-xrandr.sh

  else rm -f /etc/X11/xorg.conf.d/nvidia-legacy-optimus-outputclass.conf \
    /var/opt/nvidia-legacy-optimus-xrandr.sh

  fi

else rm -f /etc/X11/xorg.conf.d/nvidia-legacy-optimus-outputclass.conf \
  /var/opt/nvidia-legacy-optimus-xrandr.sh

fi
