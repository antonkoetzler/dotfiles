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
  # Developer tools like CMake.
  base-devel \

  # Display communication protocol.
  wayland \

  # Login Manager
  sddm \

  # Hypr suite: Tilting window, wallpaper, & lock managers.
  hyprland \
  hyprpaper \
  hyprlock \
  hypridle \

  # Statusbar
  waybar \

  # Application launcher/searcher.
  wofi \

  # Default font.
  otf-font-awesome \
  ttf-iosevka-nerd \

  # Terminal.
  kitty \

  # Browser.
  firefox \

  # File explorer.
  dolphin \

  # Graphics packages (nvidia users hush plz thx).
  xf86-video-amdgpu \
  mesa \
  mesa-utils \
  vulkan-radeon \
  opencl-amd \

  # Screenshots
  grim \
  slurp \
  wf-recorder \

  # Auto-mounting USBs.
  ntfs-3g
  udiskie \

  # Network manager.
  network-manager \

  # Laptop brightness manager.
  brightnessctl \

  # Disk viewing utility.
  gnome-disk-utility \

  # Git tab completion.
  git-completion \

  # For live grep with telescope in Neovim.
  ripgrep \

  # Technologies that https://github.com/antonkoetzler/nvim-config needs.
  go \
  npm

# xdg-desktop-portal-hyprland. This is used for compatbility of applications in hyprland for a smoother experience.
yay -S \
  gbm \
  hyprland-protocols \
  hyprlang \
  hyprutils \
  hyprwayland-scanner \
  libdrm \
  sdbus-cpp \
  wayland-protocols
git clone --recursive https://github.com/hyprwm/xdg-desktop-portal-hyprland
cd xdg-desktop-portal-hyprland/
cmake -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build
sudo cmake --install build
cd ..
rm -rf xdg-desktop-portal-hyprland

# Enabling services in systemd.
sudo systemctl enable sddm
sudo systemctl enable NetworkManager


# Prompting if https://github.com/antonkoetzler/nvim-config should also be setup.
read -p "Install https://github.com/antonkoetzler/nvim-config? THIS WILL DELETE YOUR NEOVIM CONFIGURATION. (Y/n): " -r answer
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]') # Allow answer to be validated case-insensitively.
if [[ "$answer" == "y" ]]; then
  rm -rf nvim
  git clone git@github.com:antonkoetzler/nvim-config .config/nvim
fi
