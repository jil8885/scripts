#!/bin/bash
# move to folder to download
cd $HOME/HDD/Android

if ! test -d "$HOME/HDD/Android/dot_P";
  # make a new folder to download aex source and move to that folder
  then mkdir dot_P && cd dot_P

  # repo init with Aosp extended pie source
  repo init -u git://github.com/DotOS/manifest.git -b dot-p
fi

# repo sync(in my computer, I use -j16 option, you can modify that option by the number of core)
repo sync -c -j16 --force-sync --no-clone-bundle --no-tags

# clone device source
mkdir -p device/samsung
git clone https://github.com/Jviix/device_samsung_msm8974-common device/samsung/msm8974-common
git clone https://github.com/Jviix/device_samsung_qcom-common device/samsung/qcom-common
git clone https://github.com/Jviix/device_samsung_hlte-common device/samsung/hlte-common
git clone https://github.com/Jviix/device_samsung_hltekor device/samsung/hltekor

# add dot.mk in device source
echo "# Copyright (C) 2013-2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/dot/config/common.mk)

$(call inherit-product, device/samsung/hltekor/full_hlte.mk)

PRODUCT_DEVICE := hltekor
PRODUCT_NAME := dot_hltekor" >> device/samsung/hltekor/dot.mk

# clone vendor source
mkdir -p vendor/samsung
git clone https://github.com/Jviix/proprietary_vendor_samsung vendor/samsung

# clone kernel source
mkdir -p kernel/samsung
git clone https://github.com/Jviix/android_kernel_samsung_msm8974 kernel/samsung/msm8974

# clone hardware source
mkdir -p hardware/samsung
git clone https://github.com/Jviix/hardware_samsung hardware/samsung

# add vendor setup scripts
echo "add_combo_lunch dot_hltekor-eng" >> device/samsung/hltekor/vendorsetup.sh
echo "add_combo_lunch dot_hltekor-userdebug" >> device/samsung/hltekor/vendorsetup.sh
chmod 755 device/samsung/hltekor/vendorsetup.sh

# set env to build start!
source build/envsetup.sh && lunch hltekor

# build start (in my computer, I use -j16 option, you can modify that option by the number of core)
make -j16
