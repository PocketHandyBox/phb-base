#!/bin/bash

if egrep -qe "nv340|nv390" /mnt/live/tmp/modules; then
  if grep -q i915 /proc/modules; then
  echo -e "\E[32m\033[1mnvidia-legacy-optimus-enabled"
  tput sgr0

  cp -f /opt/nvidia-legacy-optimus/nvidia-legacy-optimus-outputclass.conf \
  /etc/X11/xorg.conf.d/ 2> /dev/null

  cp -f /opt/nvidia-legacy-optimus/nvidia-legacy-optimus-xrandr.sh \
  /var/opt/nvidia-legacy-optimus-xrandr.sh 2> /dev/null
  chmod +x /var/opt/nvidia-legacy-optimus-xrandr.sh

  fi
fi
