#!/bin/bash
set -e

# Config.
REPO_URL="https://github.com/antonkoetzler/dotfiles"
DOTDIR="$HOME/.dotfiles"

# Base dependencies.
sudo pacman -S --needed --noconfirm git stow base-devel

# Install yay (AUR helper).
if ! command -v yay >/dev/null 2>&1; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  (cd /tmp/yay && makepkg -si --noconfirm)
fi

# Clone or reset dotfiles repo.
if [ ! -d "$DOTDIR/.git" ]; then
  git clone "$REPO_URL" "$DOTDIR"
else
  cd "$DOTDIR"
  git fetch origin
  git reset --hard origin/main
  git clean -fd
  git pull
fi

# Enter dotfiles directory.
cd "$DOTDIR"

# Confirm destructive stow operation.
echo "WARNING: This will overwrite existing dotfiles with repo versions"
read -p "Continue? (y/N): " a < /dev/tty
[[ "$a" =~ ^[Yy]$ ]] || exit 0

# Remove previously stowed packages (if any).
stow -D common linux 2>/dev/null || true

# Remove conflicting files (system → repo direction).
rm -f "$HOME/.bashrc"
rm -rf "$HOME/.config/hypr"

# Stow repo files into home directory.
stow common linux

# Install packages.
yay -S --noconfirm \
  hyprpaper hyprlock hypridle waybar wofi \
  otf-font-awesome ttf-iosevka-nerd kitty brave-bin dolphin \
  grim slurp wf-recorder ntfs-3g udiskie brightnessctl \
  gnome-disk-utility git-completion ripgrep go npm postgresql

# Reload Hyprland to apply new config.
if pgrep -x hyprland >/dev/null; then
  hyprctl reload
fi

# Prompt for optional Neovim setup.
read -p "Install https://github.com/antonkoetzler/nvim-config? THIS WILL DELETE YOUR NEOVIM CONFIGURATION. (y/N): " -r answer < /dev/tty
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
if [[ "$answer" == "y" ]]; then
  yay -S --noconfirm neovim
  rm -rf "$HOME/.config/nvim"
  git clone https://github.com/antonkoetzler/nvim-config "$HOME/.config/nvim"
fi

