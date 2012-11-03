#!/bin/sh

echo "Applying camera patches"

echo "Patching frameworks"
pushd frameworks/base

#camera parameters
echo "16102 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_frameworks_base refs/changes/02/16102/1
echo "16102 END"


#htc camera overlay http://r.cyanogenmod.com/#/c/13285/
echo "13285 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_frameworks_base refs/changes/85/13285/8
echo "13285 END"

popd

echo "Patching device"
pushd device/hp/tenderloin

#camera permissions
echo "16120 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/20/16120/1
echo "16120 END"

#memory split
echo "16121 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/21/16121/1
echo "16121 END"

#compat binder
echo "16122 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/22/16122/1
echo "16122 END"

#camera.apk config overlay
echo "19250 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/50/19250/3
echo "19250 END"

#media_profiles.xml
echo "25296 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/96/25296/1
echo "25296 END"

#video encoder
echo "25298 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/98/25298/1
echo "25298 END"

#3:1 split audio
echo "24711 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/11/24711/1
echo "24711 END"

#3:1 split nfs modules
echo "24725 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/25/24725/2
echo "24725 END"

#3:1 split wifi modules
echo "24724 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/24/24724/2
echo "24724 END"

popd

echo "Patching Camera.apk"
pushd packages/apps/Camera

#camera controls
echo "25233 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_packages_apps_Camera refs/changes/33/25233/1
echo "25233 END"

#restart cam on mode change
echo "25234 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_packages_apps_Camera refs/changes/34/25234/1
echo "25234 END"

#disable panorama
echo "25295 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_packages_apps_Camera refs/changes/95/25295/1
echo "25295 END"

popd

echo "Patching done"
