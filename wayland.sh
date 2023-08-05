#!/bin/sh

# Use this for better nvidia experience
# paru -S hyprland-nvidia
paru -S waybar-experimental-git sway-git wl-clipboard wlroots-nvidia

paru -S pipewire wireplumber xdg-desktop-portal-hyprland

# XWayland
paru -S xorg-xlsclients xorg-xwayland

# The good stuff
paru -S swappy grim slurp gammastep light swaybg wofi wl-clipboard cliphist

# Displays
paru -S wdisplays kanshi wl-mirror

# Qt Wayland support
paru -S qt5-wayland qt6-wayland

# Some GTK applications running via XWayland, and some Java applications need an XSettings daemon running in order to pick up the themes and font settings.
paru -S xsettingsd
