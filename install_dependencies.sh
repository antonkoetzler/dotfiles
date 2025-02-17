#!/bin/bash

# Install yay.
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -Syyu
yay -Syu

# Principal dependencies.
yay -S \
  base-devel \
  wayland \
  qt5-quickcontrols \
  qt6 \
  sddm \
  hyprland \
  hyprpaper \
  hyprlock \
  hypridle \
  xdg-desktop-portal-hyprland \
  xdg-desktop-portal-kde \
  waybar \
  wofi \
  otf-font-awesome \
  ttf-hack-nerd \
  kitty \
  firefox \
  dolphin \
  xf86-video-amdgpu \
  mesa \
  mesa-utils \
  vulkan-radeon \
  opencl-amd \
  grim \
  slurp \
  wf-recorder \
  ntfs-3g \
  udiskie \
  network-manager \
  brightnessctl \
  gnome-disk-utility \
  git-completion \
  ripgrep \
  go \
  npm

# Ensure xdg-desktop-portal-hyprland works.
dbus-update-activation-environment --systemd --all

# Enabling services in systemd.
sudo systemctl enable sddm
sudo systemctl enable NetworkManager

# Prompting if https://github.com/antonkoetzler/nvim-config should also be setup.
read -p "Install https://github.com/antonkoetzler/nvim-config? THIS WILL DELETE YOUR NEOVIM CONFIGURATION. (Y/n): " -r answer
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]') # Allow answer to be validated case-insensitively.
if [[ "$answer" == "y" ]]; then
  yay -S neovim
  rm -rf $USER/.config/nvim
  git clone git@github.com:antonkoetzler/nvim-config .config/nvim
fi
