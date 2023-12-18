#!/bin/bash

source .install/colors.sh
source .install/version.sh

echo -e $GREEN
cat <<'EOF'
______  ___________ _ _____     ______ _____ ___________ _____ _      _____ _____ 
| ___ \|  _  | ___ ( )  ___|    |  _  \  _  |_   _|  ___|_   _| |    |  ___/  ___|
| |_/ /| | | | |_/ //\ `--.     | | | | | | | | | | |_    | | | |    | |__ \ `--. 
| ___ \| | | | ___ \  `--. \    | | | | | | | | | |  _|   | | | |    |  __| `--. \
| |_/ /\ \_/ / |_/ / /\__/ /    | |/ /\ \_/ / | | | |    _| |_| |____| |___/\__/ /
\____/  \___/\____/  \____/     |___/  \___/  \_/ \_|    \___/\_____/\____/\____/
EOF
echo -e $NONE
echo "Version: ${version}"
echo ""
echo "This script should install all of my configs."
echo ""
echo "Requesting Privileges"
sudo echo "Done!"     


source .install/library.sh
source .install/required.sh
source .install/confirm-start.sh
source .install/backup.sh
source .install/preparation.sh
source .install/profile.sh
source .install/yay.sh

if [[ $profile == *"Hyprland"* ]]; then
    source .install/hyprland.sh
    source .install/hyprland-packages.sh
    source .install/install-packages.sh
fi

source .install/wallpapers.sh
source .install/vm.sh
source .install/copy.sh
source .install/config-folder.sh
if [[ $profile == *"Hyprland"* ]]; then
    source .install/hyprland-dotfiles.sh
fi
source .install/done.sh