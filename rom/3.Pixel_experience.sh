# move to folder to download
cd ~/HDD/Android

if [-d "~/HDD/Android/PEX_P"]; then
  # make a new folder to download aex source and move to that folder
  mkdir PEX_P && cd PEX_P

  # repo init with Aosp extended pie source
  repo init -u https://github.com/PixelExperience/manifest -b pie
fi

# repo sync(in my computer, I use -j16 option, you can modify that option by the number of core)
repo sync -c -j16 --force-sync --no-clone-bundle --no-tags

# clone device source
mkdir -p device/samsung
git clone https://github.com/Jviix/device_samsung_msm8974-common device/samsung/msm8974-common
git clone https://github.com/Jviix/device_samsung_qcom-common device/samsung/qcom-common
git clone https://github.com/Jviix/device_samsung_hlte-common device/samsung/hlte-common
git clone https://github.com/Jviix/device_samsung_hltekor device/samsung/hltekor

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
echo "add_combo_lunch aosp_hltekor-eng" >> device/samsung/hltekor/vendorsetup.sh
echo "add_combo_lunch aosp_hltekor-userdebug" >> device/samsung/hltekor/vendorsetup.sh
chmod 755 device/samsung/hltekor/vendorsetup.sh

# set env to build start!
source build/envsetup.sh && lunch hltekor

# build start (in my computer, I use -j16 option, you can modify that option by the number of core)
make -j16
