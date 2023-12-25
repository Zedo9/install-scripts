#!/bin/sh

paru -S hyprland waybar-experimental-git

paru -S pipewire wireplumber xdg-desktop-portal-hyprland

# XWayland
paru -S xorg-xlsclients xorg-xwayland

# The good stuff
paru -S satty-bin grim slurp gammastep light swaybg swayidle gtklock wl-clipboard wtype cliphist

# Displays
paru -S wdisplays wlr-randr wl-mirror

# Qt Wayland support
paru -S qt5-wayland qt6-wayland

# Some GTK applications running via XWayland, and some Java applications need an XSettings daemon running in order to pick up the themes and font settings.
paru -S xsettingsd
