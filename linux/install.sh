#!/bin/bash
set -e

# Vars.
REPO_URL="https://github.com/antonkoetzler/dotfiles"
DOTDIR="$HOME/.dotfiles"

# Init.
echo "==> Bootstrapping dotfiles (Linux)"

# Install base deps.
sudo pacman -S --needed --noconfirm git stow base-devel

# Install yay if missing.
if ! command -v yay >/dev/null 2>&1; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  (cd /tmp/yay && makepkg -si --noconfirm)
fi

# Clone dotfiles.
if [ ! -d "$DOTDIR" ]; then
  git clone "$REPO_URL" "$DOTDIR"
fi

# Nav to home folder.
cd "$DOTDIR"

# Advise user that we may overwrite some files.
echo
echo "WARNING: This will replace conflicting dotfiles with symlinks (using stow --adopt)."
read -p "Continue? (y/N): " a
[[ "$a" =~ ^[Yy]$ ]] || exit 0

stow --adopt common linux

# Packages.
yay -S --noconfirm \
  hyprpaper hyprlock hypridle waybar wofi \
  otf-font-awesome ttf-iosevka-nerd kitty brave-bin dolphin \
  grim slurp wf-recorder ntfs-3g udiskie brightnessctl \
  gnome-disk-utility git-completion ripgrep go npm postgresql

# Optional Neovim setup.
read -p "Install https://github.com/antonkoetzler/nvim-config? THIS WILL DELETE YOUR NEOVIM CONFIGURATION. (Y/n): " -r answer
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
if [[ "$answer" == "y" ]]; then
  yay -S --noconfirm neovim
  rm -rf "$HOME/.config/nvim"
  git clone https://github.com/antonkoetzler/nvim-config "$HOME/.config/nvim"
fi

# Fin.
echo "==> Done."
