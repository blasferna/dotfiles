#!/bin/bash

# Manage dotfiles
sudo apt install stow

# Core dependencies
sudo apt-get install build-essential
sudo sudo apt install xclip

echo "alias clip='xclip -selection clipboard'" >> ~/.bashrc
echo "alias paste='xclip -selection clipboard -o'" >> ~/.bashrc
source ~/.bashrc
