#!/bin/sh

# Configure ZSH
paru -S zsh exa zsh-syntax-highlighting zsh-autosuggestions
chsh -s /bin/zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo "export ZDOTDIR="$HOME"/.config/zsh" | sudo tee -a /etc/zsh/zshenv
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

paru -S visual-studio-code-bin 

paru -S jdk-openjdk intellij-idea-community-edition

# dotnet Tools
paru -S dotnet-sdk dotnet-runtime dotnet-host aspnet-runtime

# Node
# USE THE OFFICIAL INSTALL SCRIPT FROM GITHUB
nvm install --lts

# Docker
pacman -S docker docker-compose

# Useful TUIs
paru -S lazygit lazydocker
