#!/bin/bash
set -e

# Vars.
REPO_URL="https://github.com/antonkoetzler/dotfiles"
DOTDIR="$HOME/.dotfiles"

# Init.
echo "==> Bootstrapping dotfiles (macOS)"

# Install Homebrew if missing.
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install basic deps.
brew install git stow

# Clone dotfiles.
if [ ! -d "$DOTDIR" ]; then
  git clone "$REPO_URL" "$DOTDIR"
fi

# Nav to home folder.
cd "$DOTDIR"

# Advise user that we may override some files.
echo
echo "WARNING: This will replace conflicting dotfiles with symlinks (using stow --adopt)."
read -p "Continue? (y/N): " a
[[ "$a" =~ ^[Yy]$ ]] || exit 0

# Create symlinks.
stow --adopt common macos

# Fin.
echo "==> Done."
