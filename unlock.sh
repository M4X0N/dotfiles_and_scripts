#! /bin/bash


sudo cryptsetup open /dev/md/key key
# Here we need to enter a password. Once.
sudo mount /dev/mapper/key /mnt/key

# HOME
sudo cryptsetup open /dev/md/home --key-file /mnt/key/mainkey home  || echo "HOME not unlocked/not found"
sudo mount /dev/mapper/home /home/m4x0n && echo "HOME mounted" || echo "HOME not mounted"

# INTERNAL
sudo cryptsetup open /dev/disk/by-uuid/c701bead-f0ba-4854-8ed5-d5316ef52245 --key-file /mnt/key/mainkey internal  || echo "INTERNAL not unlocked/not found"
sudo mount /dev/mapper/internal /mnt/internal && echo "INTERNAL mounted" || echo "INTERNAL not mounted"

# EXTERNAL
sudo cryptsetup open /dev/disk/by-uuid/33ae25d7-cb37-452f-bf6c-2683a4ffb870 --key-file /mnt/key/mainkey external  || echo "EXTERNAL not unlocked/not found"
sudo mount /dev/mapper/external /mnt/external && echo "EXTERNAL mounted" || echo "EXTERNAL not mounted"

# Closing key partition
sudo umount /mnt/key
sudo cryptsetup close key
