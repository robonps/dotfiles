#!/bin/bash

# Synchronize the packages
sudo pacman -Sy

# Checking and installing required packages
_installPackagesPacman "rsync" "gum";
echo ""

# Double check rsync
if ! command -v rsync &> /dev/null; then
    echo ":: Force rsync installation"
    sudo pacman -S rsync --noconfirm
else
    echo ":: rsync double checked"
fi
echo ""
