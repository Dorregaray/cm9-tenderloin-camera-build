#!/bin/sh

TOPDIR=`pwd`

echo "Applying camera patches"

echo "Patching frameworks"
cd $TOPDIR/frameworks/base

#preview rotation
echo "25957 BEGIN"
git pull http://r.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/57/25957/2
echo "25957 END"

echo "Patching device"
cd $TOPDIR/device/hp/tenderloin

#camera permissions
echo "16120 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/20/16120/1
echo "16120 END"

#compat binder
#echo "16122 BEGIN"
#git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/22/16122/1
#echo "16122 END"

#camera hal
echo "16532 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/32/16532/10
echo "16532 END"

#camera.apk config overlay
echo "19250 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/50/19250/3
echo "19250 END"

#media_profiles.xml
echo "25296 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/96/25296/2
echo "25296 END"

#video encoder
echo "25298 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/98/25298/1
echo "25298 END"

echo "Patching Camera.apk"
cd $TOPDIR/packages/apps/Camera

#camera controls
echo "25233 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_packages_apps_Camera refs/changes/33/25233/3
echo "25233 END"

#restart cam on mode change
echo "25234 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_packages_apps_Camera refs/changes/34/25234/1
echo "25234 END"

cd $TOPDIR

echo "Patching done"
