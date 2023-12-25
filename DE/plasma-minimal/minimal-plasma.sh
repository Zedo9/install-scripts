#!/bin/sh

# Core plasma desktop components:
paru -S xdg-desktop-portal-kde plasma-desktop sddm sddm-kcm

# Wayland
# Make sure to enable the [DRM kernel mode setting](https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting "NVIDIA")
paru -S plasma-wayland-session qt5-wayland qt6-wayland

# Network
paru -S plasma-nm kio-zeroconf kio-extras kdeplasma-addons

# KWallet
paru -S kwalletmanager kwallet-pam

# Screenshots
paru -S spectacle

# File manager - archiving
paru -S dolphin dolphin-plugins ark kdf

# Themes
paru -S kde-gtk-config

# Thumbnails
paru -S kdegraphics-thumbnailers ffmpegthumbs qt5-imageformats kimageformats taglib libappimage icoutils

# PDF - Images
paru -S gwenview okular kolourpaint

# Multimedia
paru -S plasma-pa elisa

# paru -S phonon-qt5-vlc # Make sure to remove things related to gstreamer
# Legacy
# paru -S phonon-qt5-gstreamer gst-libav gst-plugins-good gst-plugins-ugly gst-plugins-bad

# Screen settings - power settings
paru -S kscreen powerdevil

# Trayicons
paru -S libappindicator-gtk3 libappindicator-gtk2

# Sensors and monitoring
paru -S lm_sensors ksysguard

# Screen magnifier - Spell checking
paru -S kmag sonnet

# Other
paru -S kcalc

# applets
paru -S plasma5-applets-netspeed plasma5-applets-betterinlineclock-git plasma5-applets-thermal-monitor
