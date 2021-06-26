#!/bin/sh

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo pacman -S x86-video-intel
sudo pacman -S nvidia nvidia-utils nvidia-settings
sudo pacman -S xorg xorg-xinput xorg-xinit numlockx
sudo pacman -S firefox alacritty nautilus picom ranger feh light
sudo pacman -S lxappearance lxsession

sudo pacman -S awesome rofi

# Compression tools
sudo pacman -S zip unzip unrar p7zip lzop

# Inputs
sudo pacman -S xf86-input-libinput xf86-input-synaptics

# Filesystem tools
sudo pacman -S dosfstools ntfs-3g btrfs-progs exfatutils gptfdisk autofs fuse2 fuse3 fuseiso

# Networking tools
sudo pacman -S net-tools bind-tools traceroute rsync wget

# Audio tools
sudo pacman -S pulseaudio pulsemixer alsa-utils alsa-plugins pavucontrol pulseeffects

# Fonts 
paru -S ttf-ms-fonts

sudo pacman -S terminus-font noto-fonts noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans gsfonts sdl_ttf ttf-bitstream-vera xorg-fonts-type1 gnu-free-fonts ttf-caladea ttf-carlito ttf-croscore ttf-hack ttf-junicode ttf-linux-libertine opendesktop-fonts ttf-anonymous-pro ttf-arphic-ukai ttf-arphic-uming ttf-baekmuk ttf-cascadia-code ttf-cormorant ttf-droid ttf-fantasque-sans-mono ttf-fira-code ttf-fira-sans ttf-fira-mono ttf-font-awesome ttf-hanazono ttf-ibm-plex ttf-hannom ttf-inconsolata ttf-indic-otf ttf-indic-otf ttf-ionicons ttf-jetbrains-mono ttf-joypixels ttf-khmer ttf-lato ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean ttf-roboto adobe-source-code-pro-fonts

# System76-power for laptops with optimus
paru -S system76-power
sudo systemctl enable system76-power.service