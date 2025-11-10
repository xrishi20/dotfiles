#!/bin/bash

# Exit immediately if any command fails
set -e

# Define source directories
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$DOTFILES_DIR/config"
FONTS_DIR="$DOTFILES_DIR/fonts"

# Define target directories
USER_CONFIG="$HOME/.config"
SYSTEM_FONTS="/usr/share/fonts"

. ./scripts/base.sh
. ./scripts/work.sh
. ./scripts/gaming.sh

echo "Copying Configs"
mkdir -p "$USER_CONFIG"
cp -r "$CONFIG_DIR"/* "$USER_CONFIG/"

echo "Installing Dank Mono"
sudo mkdir -p "$SYSTEM_FONTS"
sudo cp -r "$FONTS_DIR"/* "$SYSTEM_FONTS/"
sudo fc-cache -fv  # Update font cache

echo "Configure Git aliases"
git config --global alias.a "add ."
git config --global alias.cm "commit -m"
git config --global alias.puo "push -u origin"

echo "Configure SDDM theme"
sudo bash -c 'cat <<EOF >> /etc/sddm.conf

[Theme]
Current = Catppuccin
CursorTheme = Qogir-white-cursors
EOF'

cowsay "All Done, Don't forget to reboot. Mooooooooo!"
