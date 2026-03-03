#!/bin/bash
# Shared functions sourced by platform install scripts after the repo is cloned.
# Expects: DOTDIR, STOW_PACKAGES (string), CONFLICTING_FILES (array), DRY_RUN, run(), install_neovim_pkg()

NVIM_SSH="git@github.com:antonkoetzler/nvim-config"
NVIM_HTTPS="https://github.com/antonkoetzler/nvim-config"
ALACRITTY_THEMES="https://github.com/alacritty/alacritty-theme"

confirm_stow() {
  $DRY_RUN && { echo "=== DRY RUN — no files will be modified ==="; return 0; }
  echo "WARNING: This will overwrite existing dotfiles with repo versions"
  read -p "Continue? (y/N): " a < /dev/tty
  [[ "$a" =~ ^[Yy]$ ]] || exit 0
}

do_stow() {
  cd "$DOTDIR"
  if $DRY_RUN; then
    for f in "${CONFLICTING_FILES[@]}"; do
      echo "[dry-run] rm -rf $f"
    done
    stow -n $STOW_PACKAGES
    return 0
  fi
  stow -D $STOW_PACKAGES 2>/dev/null || true
  for f in "${CONFLICTING_FILES[@]}"; do
    rm -rf "$f"
  done
  stow $STOW_PACKAGES
}

clone_alacritty_themes() {
  local themes_dir="$HOME/.config/alacritty/themes"
  if [ ! -d "$themes_dir" ]; then
    run git clone "$ALACRITTY_THEMES" "$themes_dir"
  fi
}

prompt_nvim() {
  read -p "Install $NVIM_SSH? THIS WILL DELETE YOUR NEOVIM CONFIGURATION. (y/N): " -r answer < /dev/tty
  [[ "${answer,,}" == "y" ]] || return 0
  install_neovim_pkg
  run rm -rf "$HOME/.config/nvim"
  if $DRY_RUN; then
    echo "[dry-run] git clone $NVIM_SSH ~/.config/nvim"
  else
    git clone "$NVIM_SSH" "$HOME/.config/nvim" 2>/dev/null \
      || git clone "$NVIM_HTTPS" "$HOME/.config/nvim"
  fi
}
