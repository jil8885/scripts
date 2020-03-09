sudo apt install build-essential pkg-config libsdl1.2-dev git zlib1g-dev liblzo2-dev liblzma-dev libfontconfig-dev libicu-dev libfluidsynth-dev
sudo apt install fcitx fcitx-hangul snapd zsh wget git python3-pip openjdk-8-jdk ant language-pack-gnome-ko gnome-tweak-tool
im-config -n fcitx
sudo sh -c 'echo "deb http://repo.whale.naver.com/linux/ stable/" >> /etc/apt/sources.list.d/naver-whale.list'
wget -q -O - http://repo.whale.naver.com/linux/stable/public.key | sudo apt-key add -
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update
sudo apt install naver-whale-stable
sudo apt install google-chrome-stable
# sudo rm -rf /etc/apt/sources.list.d/google.list
# sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
#sudo apt update 
# sudo apt -y install docker-ce
wget https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh
chmod +x jetbrains-toolbox.sh
./jetbrains-toolbox.sh
