#!/bin/sh
# Inspired by https://gitlab.com/eflinux/arch-basic

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "KEYMAP=fr" >> /etc/vconsole.conf
echo "FONT=ter-132n" >> /etc/vconsole.conf

echo "arch-asus" >> /etc/hostname

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 arch-asus.localdomain arch-asus" >> /etc/hosts

pacman -S os-prober ntfs-3g

pacman -S grub efibootmgr networkmanager rsync network-manager-applet wpa_supplicant dialog mtools dosfstools base-devel linux-headers git reflector bluez bluez-utils xdg-utils xdg-user-dirs inetutils dnsutils bash-completion tlp acpi acpi_call openssh

Echo "---Services---"
systemctl enable NetworkManager
# systemctl enable bluetooth
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp 
# systemctl enable fstrim.timer

echo "---Installing Paru---"
git clone https://aur.arch.org/paru
cd paru
makepkg -si