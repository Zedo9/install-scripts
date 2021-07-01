#!/bin/sh

sudo timedatectl set-ntp true
sudo hwclock --systohc

# sudo pacman -S x86-video-intel
sudo pacman -S nvidia nvidia-utils nvidia-settings
sudo pacman -S firefox alacritty nautilus picom ranger ueberzug feh
sudo pacman -S lxappearance evince

paru -S brave-bin

# Xorg
sudo pacman -S xorg xorg-xinput xorg-xinit numlockx

sudo pacman -S lxsession flameshot gsimplecal

# WM
# sudo pacman -S awesome rofi
sudo pacman -S dunst

# Systray stuff
sudo pacman -S libappindicator-gtk2 libappindicator-gtk3

# Display manager
paru -S ly 
sudo systemctl enable ly.service

# Wayland
#sudo pacman -S sway swaylock swayidle xorg-xwayland xdg-desktop-portal-wlr wl-clipboard swappy grim slurp libnotify dunst
#paru -S wdisplays sway-desktop-launcher

# Media
sudo pacman -S mpv youtube-dl vlc

# Compression tools
sudo pacman -S zip unzip unrar p7zip lzop

# Inputs
sudo pacman -S xf86-input-libinput xf86-input-synaptics

# Filesystem tools
sudo pacman -S dosfstools ntfs-3g btrfs-progs exfatutils gptfdisk autofs fuse2 fuse3 fuseiso

# Networking tools
sudo pacman -S net-tools bind-tools traceroute rsync wget

# Pulse audio
sudo pacman -S pulseaudio pulsemixer alsa-utils alsa-plugins pavucontrol pulseeffects playerctl

# Pipewire
# sudo pacman -S alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol

# Fonts 
paru -S ttf-ms-fonts

sudo pacman -S terminus-font noto-fonts noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans gsfonts sdl_ttf ttf-bitstream-vera xorg-fonts-type1 gnu-free-fonts ttf-caladea ttf-carlito ttf-croscore ttf-hack ttf-junicode ttf-linux-libertine opendesktop-fonts ttf-anonymous-pro ttf-arphic-ukai ttf-arphic-uming ttf-baekmuk ttf-cascadia-code ttf-cormorant ttf-droid ttf-fantasque-sans-mono ttf-fira-code ttf-fira-sans ttf-fira-mono ttf-font-awesome ttf-hanazono ttf-ibm-plex ttf-hannom ttf-inconsolata ttf-indic-otf ttf-indic-otf ttf-ionicons ttf-jetbrains-mono ttf-joypixels ttf-khmer ttf-lato ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean ttf-roboto adobe-source-code-pro-fonts ttf-ubuntu-font-family

# System76-power for laptops with optimus
paru -S system76-power
sudo systemctl enable system76-power.service
