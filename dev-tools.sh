#!/bin/sh

paru -S code code-features code-icons code-marketplace intellij-idea-community-edition
pacman -S jdk11-openjdk

# Install nodejs
# https://github.com/nvm-sh/nvm
# nvm install --lts
# nvm user --lts

# Later
# pacman -S docker docker-compose
