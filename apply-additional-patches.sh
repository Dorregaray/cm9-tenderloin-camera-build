#!/bin/sh

TOPDIR=`pwd`

cd $TOPDIR/device/hp/tenderloin

#touch pressure
echo "20894 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/94/20894/1
echo "20894 END"

cd $TOPDIR
