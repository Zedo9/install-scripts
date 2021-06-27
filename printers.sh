#!/bin/sh

sudo pacman -S cups ghostscript cups-pdf hplip gutenprint

systemctl enable cups.service