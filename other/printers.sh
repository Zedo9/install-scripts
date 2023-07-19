#!/bin/sh

sudo pacman -S cups skanlite ghostscript cups-pdf hplip gutenprint

sudo systemctl start cups.service
