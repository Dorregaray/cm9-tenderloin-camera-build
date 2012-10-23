#!/bin/sh

echo "Applying camera patches"

echo "Patching frameworks"
pushd frameworks/base

#camera parameters
echo "16102 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_frameworks_base refs/changes/02/16102/1 && git cherry-pick FETCH_HEAD
echo "16102 END"


#htc camera overlay http://review.cyanogenmod.com/#/c/13285/
echo "13285 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_frameworks_base refs/changes/85/13285/8 && git cherry-pick FETCH_HEAD
echo "13285 END"

popd

echo "Patching device"
pushd device/hp/tenderloin

#camera permissions
echo "16120 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/20/16120/1 && git cherry-pick FETCH_HEAD
echo "16120 END"

#memory split
echo "16121 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/21/16121/1 && git cherry-pick FETCH_HEAD
echo "16121 END"

#compat binder
echo "16122 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/22/16122/1 && git cherry-pick FETCH_HEAD
echo "16122 END"

#camera.apk config overlay
echo "19250 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/50/19250/3 && git cherry-pick FETCH_HEAD
echo "19250 END"

#media_profiles.xml
echo "25296 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/96/25296/1 && git cherry-pick FETCH_HEAD
echo "25296 END"

#video encoder
echo "25298 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/98/25298/1 && git cherry-pick FETCH_HEAD
echo "25298 END"

popd

echo "Patching Camera.apk"
pushd packages/apps/Camera

#camera controls
echo "25233 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_packages_apps_Camera refs/changes/33/25233/1 && git cherry-pick FETCH_HEAD
echo "25233 END"

#restart cam on mode change
echo "25234 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_packages_apps_Camera refs/changes/34/25234/1 && git cherry-pick FETCH_HEAD
echo "25234 END"

#disable panorama
echo "25295 BEGIN"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_packages_apps_Camera refs/changes/95/25295/1 && git cherry-pick FETCH_HEAD
echo "25295 END"

popd

echo "Patching done"
