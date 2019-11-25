mkfs.ext4 /dev/sda3
mkswap /dev/sda5
swapon /dev/sda5
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
echo Server=http://ftp.lanet.kr/pub/archlinux/$repo/os/$arch > /etc/pacman.d/mirrorlist
echo Server=http://ftp.harukasan.org/archlinux/$repo/os/$arch >> /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware
getfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
