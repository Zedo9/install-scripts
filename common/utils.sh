#!/bin/sh

## Internet
paru -S brave-bin firefox discord liferea

## Launchers
paru -S ulauncher
# sudo pacman -S rofi
# sudo pacman -S wofi

## Misc
# Media
sudo pacman -S gpick mpv yt-dlp vlc playerctl imv eog pinta rhythmbox

# Main
sudo pacman -S alacritty ranger ueberzug feh gsimplecal
# sudo pacman -S kitty tmux

# Content creation
# sudo pacman -S inkscape lmms obs-studio

# Screen capture
paru -S peek flameshot


## Drivers
# Intel
sudo pacman -S x86-video-intel

# Nvidia
sudo pacman -S nvidia nvidia-utils nvidia-settings

# Inputs (Install either one, preferably xf86-input-libinput)
sudo pacman -S xf86-input-libinput 
# sudo pacman -S xf86-input-synaptics

# Bluetooth
pacman -S blueman bluez bluez-utils
systemctl enable bluetooth


## Tools
# Compression tools
sudo pacman -S zip unzip unrar p7zip lzop file-roller

# Filesystem tools
sudo pacman -S gnome-disk-utility dosfstools ntfs-3g btrfs-progs exfatutils gptfdisk autofs fuse2 fuse3 fuseiso

# Networking tools
sudo pacman -S net-tools bind-tools traceroute rsync wget gnome-nettool


## Audio
sudo pacman -S pavucontrol pulsemixer

# Pipewire
sudo pacman -S alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack qjackctl

# Pulse
# sudo pacman -S pulseaudio alsa-utils alsa-plugins easyeffects

## Virtualization/Administration/
paru -S gnome-boxes gnome-remote-desktop gnome-connections vino


## Virtual filesystem/ Network sharing
paru -S gvfs \
gvfs-afc \
gvfs-mtp \
gvfs-nfs \
gvfs-smb \
warpinator