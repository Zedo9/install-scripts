#!/bin/sh

sudo timedatectl set-ntp true
sudo hwclock --systohc

echo "---Installing Paru---"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si