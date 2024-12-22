#!/bin/bash
STATPUPPY=$(stat -c "%U %G" /home/puppy)
[ "$STATPUPPY" != "puppy puppy" ] && chown -R puppy:puppy /home/puppy
