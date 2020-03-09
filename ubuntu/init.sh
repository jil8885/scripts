sudo apt dist-upgrade
# sudo apt-get -y install --install-recommends linux-generic-hwe-18.04 xserver-xorg-hwe-18.04
sudo apt -y install wget curl build-essential pkg-config libsdl1.2-dev git zlib1g-dev liblzo2-dev liblzma-dev libfontconfig-dev libicu-dev libfluidsynth-dev
sudo apt -y install fcitx fcitx-hangul snapd zsh wget git python3-pip openjdk-8-jdk ant
im-config -n fcitx
wget https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh
chmod +x jetbrains-toolbox.sh
./jetbrains-toolbox.sh
sudo sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg'
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update && sudo apt-get install code
