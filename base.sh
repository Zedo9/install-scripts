#!/bin/sh
# Inspired by https://gitlab.com/eflinux/arch-basic

echo "LANG=en_US.UTF-8" >>/etc/locale.conf

echo "KEYMAP=fr" >>/etc/vconsole.conf
echo "FONT=ter-132b" >>/etc/vconsole.conf

echo "arch-asus" >>/etc/hostname

echo "127.0.0.1 localhost" >>/etc/hosts
echo "::1 localhost" >>/etc/hosts
echo "127.0.1.1 arch-asus.localdomain arch-asus" >>/etc/hosts

localectl set-x11-keymap fr

# dual boot / Windows
pacman -S os-prober ntfs-3g

pacman -S grub efibootmgr linux-tools networkmanager rsync network-manager-applet wpa_supplicant dialog mtools dosfstools base-devel linux-headers git reflector xdg-utils xdg-user-dirs terminus-font inetutils dnsutils bash-completion acpi acpid psensor acpi_call openssh man htop neofetch

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Switch Sh interpreter to Dash
pacman -S dash
ln -sfT dash /usr/bin/sh

echo "---Services---"
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable acpid
systemctl enable avahi-daemon
systemctl enable fstrim.timer # SSDs only
