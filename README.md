# Packages

```
hyprland sddm xdg-desktop-portal-hyprland swaybg xdg-user-dirs xdg-user-dirs-gtk nano waybar git openssh kitty pfetch tofi dunst unzip gvfs-mtp android-tools android-file-transfer android-udev libmtp fish starship nautilus udev-block-notify htop polkit-gnome gnome-keyring seahorse udisks2 brightnessctl bluez bluez-utils blueman qt5-wayland qt6-wayland qt5ct pipewire wireplumber pipewire-pulse playerctl pavucontrol nm-connection-editor swayimg grim slurp wl-clipboard hyprpicker ttf-jetbrains-mono-nerd ttf-lato ttf-nerd-fonts-symbols
```

### Theming

```
dracula-gtk-theme dracula-icons-git dracula-grub-theme-git sddm-sugar-candy-git
```

### Additional

```
librewolf-bin vscodium-bin-marketplace freetube-bin slack-desktop ddev-bin composer docker nodejs npm yarn
```

### Nvidia

```
nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader libva libva-nvidia-driver-git
```

### ROG

```
asusctl supergfxctl rog-control-center
```

# Configuration

### SDDM Theme

> sudo nano /etc/sddm.conf </br>

```
[Theme]
Current = sugar-candy
CursorTheme = Qogir-white-cursors
```

### SSH

```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
```

### Git

```
git config --global alias.a "add ."
git config --global alias.cm "commit -m"
git config --global alias.puo "push -u origin"
git config --global user.name "xrishi20"
git config --global user.email "*"
```
