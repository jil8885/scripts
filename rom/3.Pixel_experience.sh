#!/bin/bash
# move to folder to download
cd $HOME/HDD/Android

if ! test -d "$HOME/HDD/Android/PEX_P";
  # make a new folder to download aex source and move to that folder
  then mkdir PEX_P && cd PEX_P

  # repo init with Aosp extended pie source
  repo init -u https://github.com/PixelExperience/manifest -b pie
fi

# repo sync(in my computer, I use -j16 option, you can modify that option by the number of core)
repo sync -c -j16 --force-sync --no-clone-bundle --no-tags

# clone device source
mkdir -p device/samsung
if ! test -d "device/samsung/msm8974-common";
  then git clone https://github.com/Jviix/device_samsung_msm8974-common device/samsung/msm8974-common
else; then
  cd device/samsung/msm8974-common
  git pull
  cd ../../..
fi

if ! test -d "device/samsung/qcom-common";
  then git clone https://github.com/Jviix/device_samsung_qcom-common device/samsung/qcom-common
else; then
  cd device/samsung/qcom-common
  git pull
  cd ../../..
fi

if ! test -d "device/samsung/hlte-common";
  then git clone https://github.com/Jviix/device_samsung_hlte-common device/samsung/hlte-common
else; then
  cd device/samsung/hlte-common
  git pull
  cd ../../..
fi

if ! test -d "device/samsung/hltekor";
  then git clone https://github.com/Jviix/device_samsung_hltekor device/samsung/hltekor
else; then
  cd device/samsung/hltekor
  git pull
  cd ../../..


# clone vendor source
if ! test -d "vendor/samsung"; then
  mkdir -p vendor/samsung
  git clone https://github.com/Jviix/proprietary_vendor_samsung vendor/samsung
else; then
  cd vendor/samsung
  git pull
  cd ../..
fi

# clone kernel source
if ! test -d "kernel/samsung"; then
  mkdir -p kernel/samsung
  git clone https://github.com/Jviix/android_kernel_samsung_msm8974 kernel/samsung/msm8974
else; then
  cd kernel/samsung/msm8974
  git pull
  cd ../..
fi

# clone hardware source
if ! test -d "hardware/samsung"; then
  mkdir -p hardware/samsung
  git clone https://github.com/Jviix/hardware_samsung hardware/samsung
else; then
  cd hardware/samsung
  git pull
  cd ../..
fi

# add vendor setup scripts
echo "add_combo_lunch aosp_hltekor-eng" >> device/samsung/hltekor/vendorsetup.sh
echo "add_combo_lunch aosp_hltekor-userdebug" >> device/samsung/hltekor/vendorsetup.sh
chmod 755 device/samsung/hltekor/vendorsetup.sh

# set env to build start!
source build/envsetup.sh && lunch hltekor

# build start (in my computer, I use -j16 option, you can modify that option by the number of core)
make -j16
