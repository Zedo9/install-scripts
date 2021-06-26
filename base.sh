#!/bin/sh

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "KEYMAP=fr" >> /etc/vconsole.conf

echo "archpad" >> /etc/hostname

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 archpad.localdomain archpad" >> /etc/hosts

pacman -S os-prober ntfs-3g

pacman -S grub efibootmgr networkmanager rsync network-manager-applet wpa_supplicant dialog mtools dosfstools base-devel linux-headers git reflector bluez bluez-utils xdg-utils xdg-user-dirs inetutils dnsutils bash-completion tlp acpi acpi_call openssh
