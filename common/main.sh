#!/bin/sh

# Internet (Don't forget to enable hardware video decoding on Firefox and Brave)
paru -S brave-bin firefox discord_arch_electron element-desktop

# Launchers
paru -S ulauncher

# Media
sudo pacman -S gpick mpv yt-dlp vlc totem playerctl imv eog pinta rhythmbox

# Main
sudo pacman -S alacritty kitty ranger ueberzug feh gsimplecal dunst gnome-font-viewer xdg-desktop-portal polkit-gnome nautilus

# Content creation
# sudo pacman -S inkscape lmms obs-studio

# Screen capture
paru -S peek flameshot

# Drivers
# Intel
sudo pacman -S x86-video-intel
# Nvidia
sudo pacman -S nvidia nvidia-utils nvidia-settings
sudo pacman -S xf86-input-libinput 
# sudo pacman -S xf86-input-synaptics

# Bluetooth
pacman -S blueman bluez bluez-utils
systemctl enable bluetooth

# Compression tools
sudo pacman -S zip unzip unrar p7zip lzop file-roller

# Filesystem tools
sudo pacman -S gnome-disk-utility gparted dosfstools ntfs-3g btrfs-progs exfatutils gptfdisk autofs fuse2 fuse3 fuseiso ncdu baobab

# Networking tools
sudo pacman -S net-tools bind-tools traceroute rsync wget gnome-nettool

# Audio (Pipewire)
sudo pacman -S pavucontrol pulsemixer alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack qjackctl

# Virtualization/Administration/
paru -S gnome-boxes gnome-remote-desktop gnome-connections vino

# Virtual gvfs / Network sharing
paru -S gvfs \
gvfs-afc \
gvfs-mtp \
gvfs-gphoto2 \
gvfs-nfs \
gvfs-smb \
warpinator

# Systray stuff
sudo pacman -S libappindicator-gtk2 libappindicator-gtk3

# Display manager
# paru -S ly 
# sudo systemctl enable ly.service
