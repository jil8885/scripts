passwd
pacman -S nano
nano /etc/local.gen
export LANG=en_US.UTF-8 > /etc/locale.conf
echo jeongin-laptop > /etc/hostname
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
hwclock --systohc --utc
pacman -S zsh sudo
useradd -m -G users,wheel -s /bin/zsh jil8885
passwd jil8885
nano /etc/sudoers
pacman -S grub efibootmgr networkmanager
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch --recheck
pacman -S intel-ucode mesa
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
exit

