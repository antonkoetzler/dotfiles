#!/bin/bash
#
# Linux installation script

# Principal dependencies.
yay -S \
  base-devel \
  mesa \
  mesa-utils \
  wayland \
  qt5-quickcontrols \
  qt6 \
  sddm \
  cmake \
  meson \
  cpio \
  pkg-config \
  hyprland \
  hyprpaper \
  hyprlock \
  hypridle \
  xdg-desktop-portal-hyprland \
  xdg-desktop-portal-kde \
  waybar \
  wofi \
  otf-font-awesome \
  ttf-iosevka-nerd \
  kitty \
  brave-browser \
  dolphin \
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
  npm \
  postgresql

# Prompting if https://github.com/antonkoetzler/nvim-config should also be setup.
read -p "Install https://github.com/antonkoetzler/nvim-config? THIS WILL DELETE YOUR NEOVIM CONFIGURATION. (Y/n): " -r answer
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]') # Allow answer to be validated case-insensitively.
if [[ "$answer" == "y" ]]; then
  yay -S neovim
  rm -rf $USER/.config/nvim
  git clone git@github.com:antonkoetzler/nvim-config .config/nvim
fi
