#!/bin/bash

# Telescope dependencies
sudo apt install fzf
sudo apt-get install ripgrep
sudo apt-get install fd-find

# Compile telescope-fzf-native
cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim && make

