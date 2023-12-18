#!/bin/bash
#                _ _                              
# __      ____ _| | |_ __   __ _ _ __   ___ _ __  
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__| 
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |    
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|    
#                   |_|         |_|               
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 
case $1 in

    # Load wallpaper from .cache of last session 
    "init")
        wal -c -i $HOME/.cache/current_wallpaper.jpg
        swww init
        swww img ~/.cache/current_wallpaper.jpg
        exit 
    ;;

    # Select wallpaper with rofi
    "select")
        selected=$(ls -1 $HOME/dotfiles/wallpapers | grep "jpg" | rofi -dmenu -replace)
        if [ ! "$selected" ]; then
            echo "No wallpaper selected"
            exit
        fi
        wal -q -i $HOME/dotfiles/wallpapers/$selected &
    ;;

    # Randomly select wallpaper 
    *)
       selected=$(ls $HOME/dotfiles/wallpapers | grep "jpg" | shuf -n 1) 
       wal -q -i $HOME/dotfiles/wallpapers/$selected &
    ;;

esac


# ----------------------------------------------------- 
# Load current pywal color scheme
# ----------------------------------------------------- 
#source "$HOME/.cache/wal/colors.sh"
# echo "Wallpaper: $wallpaper"
wallpaper=$"$HOME/dotfiles/wallpapers/${selected}"

# ----------------------------------------------------- 
# Copy selected wallpaper into .cache folder
# ----------------------------------------------------- 
cp $wallpaper $HOME/.cache/current_wallpaper.jpg

# ----------------------------------------------------- 
# get wallpaper image name
# ----------------------------------------------------- 
newwall=$(echo $wallpaper | sed "s|$HOME/dotfiles/wallpapers/||g")

# ----------------------------------------------------- 
# Reload waybar with new colors
# -----------------------------------------------------
$HOME/dotfiles/waybar/launch.sh

# -----------------------------------------------------
# Reload mako
# -----------------------------------------------------
$HOME/dotfiles/mako/scripts/update-theme.sh

# ----------------------------------------------------- 
# Set the new wallpaper
# -----------------------------------------------------
transition_type="wipe"
# transition_type="outer"
# transition_type="random"

swww img $wallpaper \
    --transition-bezier .43,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type=$transition_type \
    --transition-duration=0.7 \
    --transition-pos "$( hyprctl cursorpos )"

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
sleep 1
notify-send "Colors and Wallpaper updated" "with image $newwall"

echo "DONE!"
