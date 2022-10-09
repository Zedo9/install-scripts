#!/bin/sh

# Main
paru -S plasma-meta

# Wayland support
paru -S plasma-wayland-session \
egl-wayland # Nvidia only

# Apps
paru -S kde-accessibility-meta \
kde-graphics-meta \
kde-network-meta \
kde-pim-meta \
kde-system-meta \
kde-utilities-meta \
kmix juk

