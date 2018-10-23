#!/bin/bash
# install required package on ubuntu
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install openjdk-8-jdk git git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip make liblz4-tool libncurses5 python repo android-tools-adb android-tools-fastboot chrpath gawk texinfo libsdl1.2-dev whiptail diffstat cpio libssl-dev lzip -y

# write android.rules file at /etc/udev/rules.d
sudo echo "#Samsung" >> /etc/udev/rules.d/51-android.rules
sudo echo "SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666"" >> /etc/udev/rules.d/51-android.rules

# give authority to android rules file
sudo chmod a+r /etc/udev/rules.d/51-android.rules

# make a empty folder to download android source and build
# I specify the path of my subhard, to ~/HDD
if [! -d "~/HDD/Android"]; then
  mkdir -p ~/HDD/
fi
