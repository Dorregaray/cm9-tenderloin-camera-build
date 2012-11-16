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


4. Apply the required camera patches:
```
cd ~/android/system
sh ~/android/cm9-tenderloin-camera-build/apply-camera_patches.sh
```


5. Apply additional patches (if want to):
```
cd ~/android/system
sh ~/android/cm9-tenderloin-camera-build/apply-additional-patches.sh
```


6. Now you can start the build:
```
cd ~/android/system
brunch tenderloin
```

7. Load the build onto the device as usual and you're done

