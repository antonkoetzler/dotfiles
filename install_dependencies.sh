#!/bin/bash

# Install yay.
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -Syyu
yay -Syu

# GPU drivers.
if [[ "$1" == "--gpu" || "$1" == "-g" ]]; then
  if [[ "$2" == "amd" ]]; then
    yay -S \
      xf86-video-amdgpu \
      vulkan-radeon \
      opencl-amd
  elif [[ "$2" == "nvidia" ]]; then
    yay -S nvidia
  else
    echo "Accepted values: amd, nvidia"
    exit 1
  fi
else
  echo "Usage: bash install_dependencies.sh --gpu <amd/nvidia>"
  exit 0
fi

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

# Ensure xdg-desktop-portal-hyprland works.
dbus-update-activation-environment --systemd --all

# Installing hy3: https://github.com/outfoxxed/hy3.
hyprpm update
hyprpm add https://github.com/outfoxxed/hy3
hyprpm update
hyprpm enable hy3
hyprctl reload

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
