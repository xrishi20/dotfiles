#!/bin/bash

# Exit immediately if any command fails
set -e

# Define source directories
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$DOTFILES_DIR/config"
FONTS_DIR="$DOTFILES_DIR/fonts"
WALLPAPER="$DOTFILES_DIR/wallpaper.gif"

# Define target directories
USER_CONFIG="$HOME/.config"
SYSTEM_FONTS="/usr/share/fonts"
PICTURES_DIR="$HOME/Pictures"

echo "📁 Copying configuration files to $USER_CONFIG..."
mkdir -p "$USER_CONFIG"
cp -r "$CONFIG_DIR"/* "$USER_CONFIG/"

echo "🔤 Copying fonts to $SYSTEM_FONTS (requires sudo)..."
sudo mkdir -p "$SYSTEM_FONTS"
sudo cp -r "$FONTS_DIR"/* "$SYSTEM_FONTS/"
sudo fc-cache -fv  # Update font cache

echo "🖼️ Copying wallpaper to $PICTURES_DIR..."
mkdir -p "$PICTURES_DIR"
cp "$WALLPAPER" "$PICTURES_DIR/"

echo "📦 Installing packages with YAY!"
yay -S --needed hyprland sddm xdg-desktop-portal-hyprland uwsm ddcutil swww hyprpicker git nano kitty xdg-user-dirs xdg-user-dirs-gtk waybar openssh tofi dunst gnome-font-viewer unzip gvfs-mtp android-tools android-file-transfer android-udev libmtp fish starship eza nautilus udev-block-notify htop polkit-gnome gnome-keyring seahorse udisks2 brightnessctl bluez bluez-utils blueberry qt5-wayland qt6-wayland pipewire wireplumber pipewire-pulse playerctl pavucontrol nm-connection-editor grim slurp wl-clipboard inter-font ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols papirus-icon-theme sddm-theme-sugar-candy-git

echo "🔧 Setting up Git aliases..."
git config --global alias.a "add ."
git config --global alias.cm "commit -m"
git config --global alias.puo "push -u origin"

echo "🎨 Configuring SDDM theme (requires sudo)..."
sudo bash -c 'cat <<EOF >> /etc/sddm.conf

[Theme]
Current = Sugar-Candy
CursorTheme = Qogir-white-cursors
EOF'

echo "✅ Installation complete!"
