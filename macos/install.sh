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
# Safety: reset repo to remote to prevent accidental adoption of system files
# ----------------------------
git fetch origin
git reset --hard origin/main
git clean -fd

# ----------------------------
# Confirm destructive stow operation
# ----------------------------
echo "WARNING: This will overwrite existing dotfiles with repo versions"
read -p "Continue? (y/N): " a
[[ "$a" =~ ^[Yy]$ ]] || exit 0

# ----------------------------
# Remove previously stowed packages (if any)
# ----------------------------
stow -D common macos 2>/dev/null || true

# ----------------------------
# Stow repo files into home directory
# ----------------------------
stow common macos

