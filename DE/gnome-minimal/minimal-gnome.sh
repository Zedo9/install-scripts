#!/bin/sh

gnome_packages=$(paru -Sg gnome | sed 's/gnome //g')

ignored_packages="cheese epiphany gedit gnome-backgrounds gnome-contacts gnome-maps gnome-music gnome-photos gnome-software gnome-system-monitor malcontent orca chrome-gnome-shell mutter-performance gnome-terminal"

for package in $ignored_packages; do
	gnome_packages=$(echo "$gnome_packages" | sed "s/$package//g")
done

#echo $gnome_packages
paru -S "$gnome_packages"

gnome_extra_packages="gnome-connections gnome-nettool gnome-tweaks"

paru -S "$gnome_extra_packages"

# extensions
paru -S gnome-shell-extension-appindicator gnome-shell-extension-vitals-git

# Import gnome configs
# dconf load /org/gnome < gnome-backup
