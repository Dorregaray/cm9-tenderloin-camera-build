cm9-tenderloin-camera-build
===========================

Scripts and other stuff to patch the CM9 sources to enable camera support


CURRENT STATUS:
-----

```
The camera initializes, sets parameters but segfauls when receiving preview
frame from the driver (in cam_frame function from liboemcamera.so).
```


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
```


7. Now you can start the build:
```
cd ~/android/system
brunch tenderloin
```

8. Load the build onto the device as usual and you're done
