# ------------------------------------------------------
# Install dotfiles
# ------------------------------------------------------

if [ -d ~/dotfiles-versions/$version/kitty ]; then
    _installSymLink kitty ~/.config/kitty ~/dotfiles/kitty/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/nvim ]; then
    _installSymLink nvim ~/.config/nvim ~/dotfiles/nvim/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/starship ]; then
    _installSymLink starship ~/.config/starship.toml ~/dotfiles/starship/starship.toml ~/.config/starship.toml
fi
if [ -d ~/dotfiles-versions/$version/rofi ]; then
    _installSymLink rofi ~/.config/rofi ~/dotfiles/rofi/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/mako ]; then
    _installSymLink dunst ~/.config/mako ~/dotfiles/mako/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/hypr ]; then
    _installSymLink hypr ~/.config/hypr ~/dotfiles/hypr/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/waybar ]; then
    _installSymLink waybar ~/.config/waybar ~/dotfiles/waybar/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/swaylock ]; then
    _installSymLink swaylock ~/.config/swaylock ~/dotfiles/swaylock/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/swayidle ]; then
    _installSymLink swaylock ~/.config/swayidle ~/dotfiles/swayidle/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/wlogout ]; then
    _installSymLink wlogout ~/.config/wlogout ~/dotfiles/wlogout/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/ranger ]; then
    _installSymLink ranger ~/.config/ranger ~/dotfiles/ranger/ ~/.config
fi
if [ -d ~/dotfiles-versions/$version/wal ]; then
    _installSymLink wal ~/.config/wal ~/dotfiles/wal/ ~/.config
fi
echo "Symbolic links created."
echo ""