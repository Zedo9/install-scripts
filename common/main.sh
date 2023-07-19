#!/bin/sh

# Switch Sh interpreter to Dash
paru -S dash
sudo ln -sfT dash /usr/bin/sh

# Internet (Don't forget to enable hardware video decoding on Firefox and Brave)
paru -S brave-bin firefox ungoogled-chromium

# Files
# paru -S thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler file-roller
paru -S nautilus filemanager-actions nautilus-sendto nautilus-share file-roller
# Thumbnails
paru -S tumbler poppler ffmpegthumbnailer freetype2 totem gnome-epub-thumbnailer
# Virtual gvfs / Network sharing
paru -S gvfs \
    udisks2 \
    gvfs-afc \
    gvfs-mtp \
    gvfs-gphoto2 \
    gvfs-nfs \
    gvfs-smb \
    warpinator

# Media
paru -S gpick mpv yt-dlp totem playerctl imv eog pinta amberol-git

# Main
paru -S alacritty kitty ranger feh qalculate-gtk gsimplecal dunst libnotify gnome-font-viewer

# Content creation
# paru -S inkscape lmms obs-studio

# Screen capture
paru -S peek flameshot

# Nvidia
paru -S nvidia nvidia-utils nvidia-settings
paru -S xf86-input-libinput

# Bluetooth
# pacman -S blueman bluez bluez-utils
# systemctl enable bluetooth

# Compression tools
paru -S zip unzip unrar p7zip lzop file-roller

paru -S polkit-gnome gnome-keyring

# Filesystem tools
paru -S gnome-disk-utility gparted dosfstools ntfs-3g btrfs-progs exfatutils gptfdisk autofs fuse2 fuse3 fuseiso ncdu baobab

# Networking tools
paru -S networkmanager rsync network-manager-applet wpa_supplicant net-tools bind-tools traceroute wget gnome-nettool

# Audio (Pipewire)
paru -S pavucontrol pulsemixer alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack qjackctl

# Virtualization/Administration/
# paru -S gnome-boxes gnome-remote-desktop gnome-connections vino

# Systray stuff
paru -S libappindicator-gtk2 libappindicator-gtk3

# Linux tools (usefull for cpu governor control, cpupower...)
paru -S linux-tools

echo "---Services---"
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable fstrim.timer
