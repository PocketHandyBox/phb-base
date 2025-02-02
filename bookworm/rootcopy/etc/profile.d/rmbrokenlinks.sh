#!/bin/bash

  if [ "$(ls /etc/SFS/*.txt 2> /dev/null)" ]; then
for i in $(ls /etc/SFS/); do
echo "Remove broken symlinks listed in /etc/SFS/$i . . ."
    cat /etc/SFS/$i | while read line; do
 if [ ! -e "$line" ]; then
# rename possibly existing .dpkg-new files
if [ -f "${line}".dpkg-new ]; then
mv -f "$line".dpkg-new "${line}"
continue
fi
# send to filelist to be executed with xargs below
[ -L "$line" ] && echo "$line" >> /tmp/$i
 fi
    done
xargs -d '\n' -a /tmp/$i rm    # remove symlinks

# remove leftover (empty) directories
tac /etc/SFS/$i | while read line; do
if [ -d "$line" ]; then
rmdir "$line" 2> /dev/null 
fi
done

rm -f /etc/SFS/$i # remove list when done
rm -f /tmp/$i
done
  fi
