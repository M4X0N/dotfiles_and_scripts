#! /bin/bash

FILENAME=$(date +%F-%R)

sudo btrfs subvolume snapshot / /.snapshots/$FILENAME

echo Snapshot $FILENAME created
