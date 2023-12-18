#!/bin/bash

echo ""
echo "You may cancel the install at any time with CTRL + C"

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
if [ $SCRIPTPATH = "$HOME/dotfiles" ]; then
    echo "Script inside install directory. Failing..."
    exit 1
fi

if gum confirm "Start Install?";then
    echo "Installation started."
elif [ $? -eq 130 ]; then
        exit 130
else
    echo "Installation canceled."
    exit 1;
fi
echo ""