#!/bin/sh

sudo pacman -S light cbatticon

paru -S auto-cpufreq
sudo systemctl enable --now auto-cpufreq