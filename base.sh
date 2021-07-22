#!/bin/sh
# Inspired by https://gitlab.com/eflinux/arch-basic

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "KEYMAP=fr" >> /etc/vconsole.conf
echo "FONT=ter-132n" >> /etc/vconsole.conf

echo "arch-asus" >> /etc/hostname

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 arch-asus.localdomain arch-asus" >> /etc/hosts

localectl set-x11-keymap fr

# dual boot / Windows
pacman -S os-prober ntfs-3g

pacman -S grub efibootmgr networkmanager rsync network-manager-applet wpa_supplicant dialog mtools dosfstools base-devel linux-headers git reflector bluez bluez-utils xdg-utils xdg-user-dirs inetutils dnsutils bash-completion acpi acpi_call openssh man htop neofetch

#Laptop 
pacman -S tlp light
systemctl enable tlp 

echo "---Services---"
systemctl enable NetworkManager
# systemctl enable bluetooth
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable fstrim.timer