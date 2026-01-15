#!/bin/bash

echo "Work Related Packages"
yay -S --needed brave-bin librewolf-bin vscodium-bin-marketplace slack-desktop-wayland docker ddev-bin

echo "Docker Services Setup"
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "Install Local Development Certificates"
mkcert -install