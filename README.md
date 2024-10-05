# Packages

```
hyprland sddm xdg-desktop-portal-hyprland hyprpaper hyprpicker git nano kitty xdg-user-dirs xdg-user-dirs-gtk waybar openssh reflector tofi ddcutil dunst gnome-font-viewer swayimg unzip gvfs-mtp android-tools android-file-transfer android-udev libmtp fish nautilus udev-block-notify htop polkit-gnome gnome-keyring seahorse udisks2 brightnessctl bluez bluez-utils blueman qt5-wayland qt6-wayland pipewire wireplumber pipewire-pulse playerctl pavucontrol nm-connection-editor grim slurp wl-clipboard ttf-nerd-fonts-symbols sddm-theme-sugar-candy-git inter-font ttf-jetbrains-mono-nerd
```

### Optional

```
librewolf-bin vscodium-bin-marketplace zed slack-desktop ddev-bin composer docker nodejs npm
```

### Gaming

```
steam gamemode gamescope mangohud wine winetricks proton-ge-custom-bin heroic-games-launcher-bin
```

# Configuration

### Git Aliases

```
git config --global user.name ""
git config --global user.email ""
git config --global alias.a "add ."
git config --global alias.cm "commit -m"
git config --global alias.puo "push -u origin"
```

### SSH Permissions

```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
```

### SDDM Theme

> sudo nano /etc/sddm.conf </br>

```
[Theme]
Current = Sugar-Candy
CursorTheme = Qogir-white-cursors
```