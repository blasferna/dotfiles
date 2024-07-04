#!/bin/bash

# Source core dependencies
source "$(dirname "$0")/core_dependencies.sh"

# Ask user if they want to install Telescope dependencies
read -p "Do you want to install Telescope dependencies? (y/n) " answer
if [[ $answer =~ ^[Yy]$ ]]; then
    source "$(dirname "$0")/telescope_dependencies.sh"
fi

# Ask user if they want to install Python dependencies
read -p "Do you want to install Python dependencies? (y/n) " answer
if [[ $answer =~ ^[Yy]$ ]]; then
    source "$(dirname "$0")/python_dependencies.sh"
fi

read -p "Do you want to install git-delta? (y/n) " answer
if [[ $answer =~ ^[Yy]$ ]]; then
    source "$(dirname "$0")/install_git_delta.sh"
fi
