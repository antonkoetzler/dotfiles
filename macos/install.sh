#!/bin/bash
set -e

# Parse flags.
DRY_RUN=false
for arg in "$@"; do
  [[ "$arg" == "--dry-run" || "$arg" == "-n" ]] && DRY_RUN=true
done

# Wrap commands: echo in dry-run, execute otherwise.
run() { $DRY_RUN && { echo "[dry-run] $*"; return 0; }; "$@"; }

# Config.
DOTDIR="$HOME/.dotfiles"
STOW_PACKAGES="common macos"
CONFLICTING_FILES=(
  "$HOME/.zshrc"
  "$HOME/.aerospace.toml"
  "$HOME/.tmux.conf"
  "$HOME/.config/alacritty/alacritty.toml"
  "$HOME/.markdownlint.yaml"
)

install_neovim_pkg() { run brew install neovim; }

# Install Homebrew if missing.
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Base dependencies (needed even in dry-run for the stow simulation).
brew install git stow

# Clone or reset dotfiles repo via HTTPS (works for everyone).
# Push remote is set to SSH so the owner can push with git directly.
if [ ! -d "$DOTDIR/.git" ]; then
  git clone "https://github.com/antonkoetzler/dotfiles" "$DOTDIR"
else
  cd "$DOTDIR"
  git fetch origin
  git reset --hard origin/main
  git clean -fd
  git pull
fi
git -C "$DOTDIR" remote set-url --push origin "git@github.com:antonkoetzler/dotfiles.git"

# Load shared functions.
source "$DOTDIR/install_common.sh"

# Confirm, stow, clone themes.
confirm_stow
do_stow
clone_alacritty_themes

# Optional Neovim.
prompt_nvim
