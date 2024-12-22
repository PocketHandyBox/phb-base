#!/bin/sh
case "$3" in
    close)
# suspend to RAM
echo -n mem > /sys/power/state
### comment out previous line and uncomment the next to SHUTDOWN when closing lid
# poweroff
;;
esac