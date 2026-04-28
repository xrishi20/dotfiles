#!/bin/bash

echo "Work Related Packages"
yay -S --needed helium-browser-bin zed slack-desktop-wayland docker ddev-bin

echo "Docker Services Setup"
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo usermod -aG docker $USER

echo "Install Local Development Certificates"
mkcert -install
