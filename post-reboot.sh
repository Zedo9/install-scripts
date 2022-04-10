#!/bin/sh

sudo timedatectl set-ntp true
sudo hwclock --systohc

echo "---Installing Paru---"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Intel
#sudo pacman -S x86-video-intel

# Nvidia
sudo pacman -S nvidia nvidia-utils nvidia-settings

# Main apps
sudo pacman -S alacritty nautilus ranger ueberzug feh

# Tools
sudo pacman -S lxappearance polkit-gnome playerctl flameshot gsimplecal discord liferea

paru -S mons lxrandr-gtk3 arandr

# PDF
sudo pacman -S evince zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps

# Browsers
paru -S brave-bin
sudo pacman -S firefox qutebrowser

# Cloud utilities
#paru -S rclone

# Xorg
sudo pacman -S xorg xorg-xinput xorg-xinit numlockx xdg-desktop-portal-gnome picom

# Launcher
# paru -S ulauncher sway-launcher-desktop 
# sudo pacman -S rofi
sudo pacman -S wofi

# Awesome
# sudo pacman -S awesome

# DWM 
paru -S dunst

# Systray stuff
sudo pacman -S libappindicator-gtk2 libappindicator-gtk3

# Display manager
# paru -S ly 
# sudo systemctl enable ly.service

# Wayland
# sudo pacman -S sway swaylock-effects swayidle xorg-xwayland waybar xdg-desktop-portal-wlr qt5-wayland  wl-clipboard swappy grim slurp libnotify dunst glfw-wayland xorg-xlsclients libpipewire02 wmctrl
# paru -S wdisplays 

# Media
sudo pacman -S mpv youtube-dl vlc imv eog

# Compression tools
sudo pacman -S zip unzip unrar p7zip lzop

# Inputs (Install either one, preferably xf86-input-libinput)
sudo pacman -S xf86-input-libinput 
# sudo pacman -S xf86-input-synaptics

# Filesystem tools
sudo pacman -S gnome-disk-utility dosfstools ntfs-3g btrfs-progs exfatutils gptfdisk autofs fuse2 fuse3 fuseiso

# Networking tools
sudo pacman -S net-tools bind-tools traceroute rsync wget

# Audio 
sudo pacman -S pavucontrol pulsemixer
# Pulse
# sudo pacman -S pulseaudio alsa-utils alsa-plugins easyeffects

# Pipewire
sudo pacman -S alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol

# Fonts 
paru -S ttf-ms-fonts ttf-monaco

sudo pacman -S terminus-font noto-fonts noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans gsfonts sdl_ttf ttf-bitstream-vera xorg-fonts-type1 gnu-free-fonts ttf-caladea ttf-carlito ttf-croscore ttf-hack ttf-junicode ttf-linux-libertine opendesktop-fonts ttf-anonymous-pro ttf-arphic-ukai ttf-arphic-uming ttf-baekmuk ttf-cascadia-code ttf-cormorant ttf-droid ttf-fantasque-sans-mono ttf-fira-code ttf-fira-sans ttf-fira-mono ttf-font-awesome ttf-hanazono ttf-ibm-plex ttf-hannom ttf-inconsolata ttf-indic-otf ttf-indic-otf ttf-ionicons ttf-jetbrains-mono ttf-joypixels ttf-khmer ttf-lato ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean ttf-roboto adobe-source-code-pro-fonts ttf-ubuntu-font-family

# Laptops
sudo pacman -S cbatticon

paru -S auto-cpufreq
sudo systemctl enable --now auto-cpufreq

# paru -S system76-power
# sudo systemctl enable system76-power.service
