#!/bin/bash
#
# Linux installation script.
#
# This script assumes you've already installed hyprland, GPU drivers, etc.
#
# This just installs extra shit that I use in my day-to-day.

# Install yay
if ! command -v yay >/dev/null 2>&1; then
  sudo pacman -S --needed --noconfirm base-devel git
  git clone https://aur.archlinux.org/yay.git /tmp/yay && (cd /tmp/yay && makepkg -si --noconfirm)
fi

# Principal dependencies.
yay -S \
  hyprpaper \
  hyprlock \
  hypridle \
  waybar \
  wofi \
  otf-font-awesome \
  ttf-iosevka-nerd \
  kitty \
  brave-bin \
  dolphin \
  grim \
  slurp \
  wf-recorder \
  ntfs-3g \
  udiskie \
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
