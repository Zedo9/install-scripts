#!/bin/sh

sudo pacman -S cups ghostscript cups-pdf hplip gutenprint

sudo systemctl start cups.service