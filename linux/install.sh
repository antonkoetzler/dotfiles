#!/bin/bash
set -e

# Parse flags.
DRY_RUN=false
for arg in "$@"; do
  [[ "$arg" == "--dry-run" || "$arg" == "-n" ]] && DRY_RUN=true
done

# Wrap commands: echo in dry-run, execute otherwise.
# </dev/null prevents subprocesses from consuming the curl pipe when run via `curl | bash`.
run() { $DRY_RUN && { echo "[dry-run] $*"; return 0; }; "$@" </dev/null; }

# Config.
DOTDIR="$HOME/.dotfiles"
STOW_PACKAGES="common linux"
CONFLICTING_FILES=(
  "$HOME/.bashrc"
  "$HOME/.config/hypr"
  "$HOME/.tmux.conf"
  "$HOME/.config/alacritty/alacritty.toml"
  "$HOME/.markdownlint.yaml"
)

install_neovim_pkg() { run yay -S --noconfirm neovim; }

# Base dependencies (needed even in dry-run for the stow simulation).
sudo pacman -S --needed --noconfirm git stow base-devel </dev/null

# Install yay (AUR helper).
if ! command -v yay >/dev/null 2>&1; then
  run git clone https://aur.archlinux.org/yay.git /tmp/yay
  if ! $DRY_RUN; then
    (cd /tmp/yay && makepkg -si --noconfirm </dev/null)
  else
    echo "[dry-run] cd /tmp/yay && makepkg -si --noconfirm"
  fi
fi

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

# Install packages.
if $DRY_RUN; then
  echo "[dry-run] yay -S --noconfirm <packages>"
else
  yay -S --noconfirm \
    meson cpio cmake hyprpaper hyprlock hypridle waybar wofi \
    otf-font-awesome ttf-iosevka-nerd alacritty brave-bin thunar \
    grim slurp wf-recorder ntfs-3g udiskie brightnessctl \
    gnome-disk-utility git-completion ripgrep go npm postgresql tmux </dev/null
fi

# Reload Hyprland to apply new config.
run hyprpm update
run hyprctl reload

# Optional Neovim.
prompt_nvim
