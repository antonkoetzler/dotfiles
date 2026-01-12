#!/bin/bash
set -e

# ----------------------------
# Config
# ----------------------------
REPO_URL="https://github.com/antonkoetzler/dotfiles"
DOTDIR="$HOME/.dotfiles"

# ----------------------------
# Install Homebrew if missing
# ----------------------------
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ----------------------------
# Base dependencies
# ----------------------------
brew install git stow

# ----------------------------
# Clone or update dotfiles repo
# ----------------------------
if [ ! -d "$DOTDIR/.git" ]; then
  git clone "$REPO_URL" "$DOTDIR"
else
  cd "$DOTDIR"
  git pull
fi

# ----------------------------
# Enter dotfiles directory
# ----------------------------
cd "$DOTDIR"

# ----------------------------
# Confirm destructive stow operation
# ----------------------------
echo "WARNING: This will replace conflicting dotfiles using stow --adopt"
read -p "Continue? (y/N): " a
[[ "$a" =~ ^[Yy]$ ]] || exit 0

# ----------------------------
# Remove previously stowed packages (if any)
# ----------------------------
stow -D common macos 2>/dev/null || true

# ----------------------------
# Adopt existing files and create symlinks
# ----------------------------
stow --adopt common macos

