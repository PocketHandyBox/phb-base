sudo bash
./build bookworm-xfce.conf
BUILD686=TRUE ./build bookworm-xfce.conf

SYSTEMD=TRUE ./build bookworm-xfce.conf
SYSTEMD=TRUE BUILD686=TRUE ./build bookworm-xfce.conf
