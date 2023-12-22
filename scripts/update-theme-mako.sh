#!/bin/sh

. "$HOME/.cache/wal/colors.sh"

conffile="$HOME/.config/mako/config"
echo $conffile

# Associative array, color name -> color code.
declare -A colors
colors=(
    ["background-color"]="${background}cc"
    ["text-color"]="$foreground"
    ["border-color"]="$color13"
)

echo $colors

for color_name in "${!colors[@]}"; do
  # replace first occurance of each color in config file
  sed -i "0,/^$color_name.*/{s//$color_name=${colors[$color_name]}/}" $conffile
done

makoctl reload