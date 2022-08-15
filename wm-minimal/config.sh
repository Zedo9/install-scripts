#!/bin/sh

paru -S mons lxrandr-gtk3 arandr lxappearance

# Notifications
paru -S dunst

# Systray stuff
sudo pacman -S libappindicator-gtk2 libappindicator-gtk3

# Window Managers
# sudo pacman -S awesome

# Display manager
# paru -S ly 
# sudo systemctl enable ly.service