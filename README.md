# Packages

```
hyprland sddm xdg-desktop-portal-hyprland hyprpicker hypridle hyprlock git nano kitty swww xdg-user-dirs xdg-user-dirs-gtk waybar openssh tofi dunst unzip gvfs-mtp android-tools android-file-transfer android-udev libmtp fish starship nautilus udev-block-notify htop polkit-gnome gnome-keyring seahorse udisks2 brightnessctl bluez bluez-utils blueman qt5-wayland qt6-wayland qt5ct pipewire wireplumber pipewire-pulse playerctl pavucontrol nm-connection-editor grim slurp wl-clipboard ttf-jetbrains-mono-nerd ttf-lato ttf-nerd-fonts-symbols sddm-sugar-candy-git
```

### Work Stuff

```
librewolf-bin vscodium-bin-marketplace slack-desktop ddev-bin composer docker nodejs npm yarn
```

### Nvidia

```
nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader libva libva-nvidia-driver-git
```

### ROG

```
asusctl rog-control-center supergfxctl
```

### Gaming

```
steam heroic-games-launcher-bin gamemode gamescope mangohud wine winetricks proton-ge-custom-bin
```

# Configuration

### SDDM Theme

> sudo nano /etc/sddm.conf </br>

```
[Theme]
Current = sugar-candy
CursorTheme = Qogir-white-cursors
```

### SDDM on Nvidia display

> sudo nano /usr/share/sddm/scripts/Xsetup </br>

```
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
```

### SSH

```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
```

### Git

```
git config --global user.name "*"
git config --global user.email "*"
git config --global alias.a "add ."
git config --global alias.cm "commit -m"
git config --global alias.puo "push -u origin"
```
