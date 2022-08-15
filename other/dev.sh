#!/bin/sh

paru -S visual-studio-code-bin 

paru -S jdk-openjdk intellij-idea-community-edition

# dotnet Tools
paru -S dotnet-sdk dotnet-runtime dotnet-host aspnet-runtime

# Docker
pacman -S docker docker-compose

# Useful TUIs
paru -S lazygit lazydocker ncdu
