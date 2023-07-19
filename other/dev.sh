#!/bin/sh

# Configure ZSH
# paru -S zsh exa zsh-syntax-highlighting zsh-autosuggestions
# chsh -s /bin/zsh

# paru -S visual-studio-code-bin
# paru -S jdk-openjdk intellij-idea-community-edition

# dotnet Tools
paru -S dotnet-sdk dotnet-runtime dotnet-host aspnet-runtime

paru -S neovim stylua shellcheck shellfmt tmux fd fzf ripgrep

# Node
# USE THE OFFICIAL INSTALL SCRIPT FROM GITHUB
nvm install --lts

# Docker
pacman -S docker docker-compose

# Useful TUIs
paru -S lazygit lazydocker
