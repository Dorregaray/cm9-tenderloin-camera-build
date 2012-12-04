#!/bin/sh

TOPDIR=`pwd`

echo "Applying camera patches"

echo "Patching frameworks"
cd $TOPDIR/frameworks/base

# preview rotation
echo "25957 BEGIN"
git pull http://r.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/57/25957/2
echo "25957 END"

echo "Patching Camera.apk"
cd $TOPDIR/packages/apps/Camera

# camera controls
echo "25233 BEGIN"
git pull http://r.cyanogenmod.com/CyanogenMod/android_packages_apps_Camera refs/changes/33/25233/3
echo "25233 END"

cd $TOPDIR

echo "Patching done"
