#!/bin/bash
set -e

# Config.
REPO_URL="https://github.com/antonkoetzler/dotfiles"
DOTDIR="$HOME/.dotfiles"

# Install Homebrew if missing.
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Base dependencies.
brew install git stow

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
stow -D common macos 2>/dev/null || true

# Stow repo files into home directory.
stow common macos

# Prompt for optional Neovim setup.
read -p "Install https://github.com/antonkoetzler/nvim-config? THIS WILL DELETE YOUR NEOVIM CONFIGURATION. (y/N): " -r answer < /dev/tty
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
if [[ "$answer" == "y" ]]; then
  yay -S --noconfirm neovim
  rm -rf "$HOME/.config/nvim"
  git clone https://github.com/antonkoetzler/nvim-config "$HOME/.config/nvim"
fi
