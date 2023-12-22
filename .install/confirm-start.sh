#!/bin/bash

echo ""
echo "You may cancel the install at any time with CTRL + C"

if gum confirm "Start Install?";then
    echo "Installation started."
elif [ $? -eq 130 ]; then
        exit 130
else
    echo "Installation canceled."
    exit 1;
fi
echo ""