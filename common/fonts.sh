#!/bin/sh

# MS fonts
paru -S ttf-ms-fonts

# Coding fonts
paru -S ttf-monaco ttf-fira-mono ttf-cascadia-code ttf-fira-code ttf-jetbrains-mono awesome-terminal-fonts otf-monaspace

paru -S ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols
sudo ln -s /usr/share/fontconfig/conf.avail/10-nerd-font-symbols.conf /etc/fonts/conf.d

# Default fonts
paru -S terminus-font \
	noto-fonts \
	noto-fonts-emoji \
	ttf-symbola \
	noto-fonts-extra \
	noto-fonts-cjk \
	ttf-dejavu \
	ttf-input \
	ttf-liberation \
	ttf-opensans \
	gnu-free-fonts \
	ttf-caladea \
	ttf-carlito \
	libertinus-font \
	opendesktop-fonts \
	ttf-droid \
	ttf-font-awesome \
	ttf-joypixels \
	ttf-roboto \
	adobe-source-code-pro-fonts \
	ttf-ubuntu-font-family
