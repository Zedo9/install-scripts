#!/bin/sh

sudo pacman -S onlyoffice-bin hunspell-en_US hunspell-fr texlive-most texlive-lang biber
# Tesseract transforms images into text
paru -S texlive-tikz-uml tesseract
