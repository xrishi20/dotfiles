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
LOCAL_DIR="$DOTFILES_DIR/local"

# Define target directories
USER_CONFIG="$HOME/.config"
USER_LOCAL="$HOME/.local"

# Dirs
echo "Created Basic Directories"
mkdir -p ~/Documents ~/Downloads ~/Videos ~/Projects ~/Pictures/Wallpapers

# Installing Pckages
echo "Installing Packages"
yay -S --needed --noconfirm niri xwayland-satellite greetd noctalia noctalia-greeter xdg-desktop-portal-gtk git nano kitty ddcutil pastel wl-clipboard xdg-user-dirs xdg-user-dirs-gtk openssh unzip gvfs-mtp android-tools android-file-transfer android-udev libmtp fish starship nautilus udisks2 brightnessctl bluez bluez-utils qt5-wayland qt6-wayland pipewire wireplumber pipewire-pulse playerctl pavucontrol nm-connection-editor inter-font ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols noto-fonts-emoji papirus-icon-theme librewolf zed deno localsend-bin

# Configs
echo "Copying Configs"
mkdir -p "$USER_CONFIG"
mkdir -p "$USER_LOCAL"
cp -r "$CONFIG_DIR"/* "$USER_CONFIG/"
cp -r "$LOCAL_DIR"/* "$USER_LOCAL/"

# Git
echo "Configured Git aliases"
git config --global alias.a "add ."
git config --global alias.cm "commit -m"
git config --global alias.puo "push -u origin"

# Greeter
echo "Configured Greetd"
sudo bash -c 'cat <<EOF > /etc/greetd/config.toml
[terminal]
vt = 1

[default_session]
command = "/usr/bin/noctalia-greeter-session -- --session niri"
user = "greeter"
EOF'

# Fish
echo "Setting Fish as default shell"
chsh -s /usr/bin/fish

# Enable Greetd
echo "Enable Greetd"
sudo systemctl enable --now greetd
