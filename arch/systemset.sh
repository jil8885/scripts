passwd
nano -w /etc/local.gen
export LANG=en_US.UTF-8 > /etc/locale.conf
echo jeongin-laptop > /etc/hostname
ntpd -q -g
hwclock --systohc --utc
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
pacman -S zsh sudo
useradd -m -G users,wheel -s /bin/zsh jil8885
passwd jil8885
EDITOR=nano visudo
visudo /etc/sudoers
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch --recheck
pacman -S amd-ucode nvidia
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
pacman -S gnome
systemctl enable gdm
nvidia-xconfig
exit

