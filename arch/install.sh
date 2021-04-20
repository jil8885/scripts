mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mount /dev/sda1 /mnt
mkdir /mnt/boot
mount /dev/nvmen0p1 /mnt/boot
echo Server='http://ftp.lanet.kr/pub/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
echo Server='http://ftp.harukasan.org/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware nano networkmanager base-devel
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
