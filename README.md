cm9-tenderloin-camera-build
===========================

Scripts and other stuff to patch the CM9 sources to enable camera support


BUILD INSTRUCTIONS:
-----

1. Download and configure the CM9 sources according to the following guide:
```
http://goo.gl/Zpht8
```
Stop before launching "brunch tenderloin" command.


2. Download this repository to ~/android:
```
cd ~/android
git clone git://github.com/Dorregaray/cm9-tenderloin-camera-build.git
```


3. Enter the ~/android/system/kernel/hp directory and replace the kernel sources:
```
cd ~/android/system/kernel/hp
mv tenderloin tenderloin.orig
git clone -b ics git://github.com/Dorregaray/hp-kernel-tenderloin.git tenderloin
```


4. Enter the ~/android/system/device/hp/tenderloin and download and enable the
camera libraries
```
cd ~/android/system/device/hp/tenderloin
git clone git://github.com/Dorregaray/camerahal.git
git clone https://github.com/Dorregaray/libcamera2
patch -p1 < ~/android/cm9-tenderloin-camera-build/enable-camerahal.patch
git stash
```


5. Replace the proprietary camera libs with the ones from CM7a2.1:
```
cp ~/android/cm9-tenderloin-camera-build/proprietary/libcamera.so ~/android/system/vendor/hp/tenderloin/proprietary/lib
cp ~/android/cm9-tenderloin-camera-build/proprietary/liboemcamera.so ~/android/system/vendor/hp/tenderloin/proprietary/lib
```


6. Apply the required camera patches:
```
cd ~/android/system
sh ~/android/cm9-tenderloin-camera-build/apply-camera_patches.sh
pushd device/hp/tenderloin/ && git stash pop && popd
```


7. Now you can start the build:
```
cd ~/android/system
brunch tenderloin
```

8. Load the build onto the device as usual and you're done


HOW TO GET THE WIFI WORKING:
-----

In order to have the fully working wifi you have to replace the existing prebuilt modules
with the ones compiled for the new kernel memory split.
You can take the binary modules from my build (from /system/lib/modules directory)
or build them on your own following the http://review.cyanogenmod.com/#/c/15011/:

1. Add:
<project path="external/compat-wireless"
	name="TouchpadCM/compat-wireless-3.5-rc3-1-sn"
	revision="master"
	remote="github" />
to ~/android/system/.repo/local_manifest.xml

2. Apply the patch:
cd ~/android/system/device/hp/tenderloin
git fetch http://review.cyanogenmod.com/CyanogenMod/android_device_hp_tenderloin refs/changes/11/15011/7 && git cherry-pick FETCH_HEAD

3. Rebuild the image.
