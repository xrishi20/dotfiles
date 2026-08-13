#!/bin/bash

# Exit immediately if any command fails
set -e

# Install YAY!
echo "Installing YAY!"
git clone --depth=1 https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin

# Define source directories
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$DOTFILES_DIR/config"

# Define target directories
USER_CONFIG="$HOME/.config"

# Installing Pckages
echo "Installing Base Packages"
yay -S --needed --noconfirm hyprland sddm awww hyprpicker xdg-desktop-portal-hyprland xdg-desktop-portal-gtk git nano kitty uwsm ddcutil xdg-user-dirs xdg-user-dirs-gtk waybar openssh tofi dunst gnome-font-viewer unzip gvfs-mtp android-tools android-file-transfer android-udev libmtp fish fisher starship nautilus htop polkit-gnome gnome-keyring seahorse udisks2 brightnessctl bluez bluez-utils blueman qt5-wayland qt6-wayland pipewire wireplumber pipewire-pulse playerctl pavucontrol nm-connection-editor grim slurp wl-clipboard inter-font ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols noto-fonts-emoji papirus-icon-theme sddm-sugar-candy-git papirus-folders helium-browser-bin zed deno

# Copy Configs
echo "Copying Configs"
mkdir -p "$USER_CONFIG"
cp -r "$CONFIG_DIR"/* "$USER_CONFIG/"

# Git
echo "Configure Git aliases"
git config --global alias.a "add ."
git config --global alias.cm "commit -m"
git config --global alias.puo "push -u origin"

# SDDM
echo "Configure SDDM theme"
sudo bash -c 'cat <<EOF >> /etc/sddm.conf

[Theme]
Current = sugar-candy
CursorTheme = Vision
EOF'

# Papirus Folders
echo "Setting Papirus Folders theme"
papirus-folders -C cyan

# Fish
echo "Setting Fish as default shell"
chsh -s /usr/bin/fish

# Enable SDDM
sudo systemctl enable --now sddm
