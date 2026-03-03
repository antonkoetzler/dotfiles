# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Dotfiles for Arch Linux, macOS, and Windows, managed with GNU Stow (Linux/macOS) and a PowerShell equivalent (Windows). Configs are split into `common/` (cross-platform), `linux/`, `macos/`, and `windows/` directories. GNU Stow symlinks directory contents into `$HOME` so edits in the repo show as git diffs.

## Installation

```bash
# Linux (Arch)
curl -fsSL https://raw.githubusercontent.com/antonkoetzler/dotfiles/main/linux/install.sh | bash

# macOS
curl -fsSL https://raw.githubusercontent.com/antonkoetzler/dotfiles/main/macos/install.sh | bash

# Windows (PowerShell)
irm https://raw.githubusercontent.com/antonkoetzler/dotfiles/main/windows/install.ps1 | iex
```

Pass `--dry-run` (Linux/macOS: `bash -s -- --dry-run`, Windows: `-DryRun`) to preview what would happen without making changes.

## Stow Structure

Files live under `common/`, `linux/`, or `macos/` as if those directories were `$HOME`. GNU Stow creates file-level symlinks. For example:
- `common/.config/alacritty/alacritty.toml` → `~/.config/alacritty/alacritty.toml`
- `linux/.config/hypr/hyprland.conf` → `~/.config/hypr/hyprland.conf`
- `macos/.aerospace.toml` → `~/.aerospace.toml`

To manually apply after making changes: `cd ~/.dotfiles && stow common linux` (or `macos`).

## Shared Install Logic

`install_common.sh` (repo root) is sourced by `linux/install.sh` and `macos/install.sh` **after** the repo is cloned. It defines `confirm_stow()`, `do_stow()`, `clone_alacritty_themes()`, and `prompt_nvim()`. Platform scripts define `DOTDIR`, `STOW_PACKAGES`, `CONFLICTING_FILES`, `DRY_RUN`, `run()`, and `install_neovim_pkg()` before sourcing it.

The Windows script (`windows/install.ps1`) is standalone and implements its own `Invoke-Stow` function using PowerShell symlinks.

## What's Configured

| Config | Location | Platform |
|--------|----------|----------|
| Alacritty terminal | `common/.config/alacritty/` | All |
| tmux | `common/.tmux.conf` | All |
| Hyprland WM | `linux/.config/hypr/` | Linux |
| Waybar | `linux/.config/waybar/` | Linux |
| Wofi launcher | `linux/.config/wofi/` | Linux |
| Bash | `linux/.bashrc` | Linux |
| AeroSpace WM | `macos/.aerospace.toml` | macOS |
| Zsh | `macos/.zshrc` | macOS |

Neovim config: separate repo `git@github.com:antonkoetzler/nvim-config` (install scripts offer to clone it).
Alacritty themes: external repo `https://github.com/alacritty/alacritty-theme`, cloned to `~/.config/alacritty/themes/` by install scripts (not tracked here).

## Key Details

- **Clone**: HTTPS for everyone; SSH push remote set automatically for the owner (`git@github.com:antonkoetzler/dotfiles.git`)
- **Font**: Iosevka Nerd Font Mono in Alacritty
- **Hyprland border color**: `#32A8A8` (teal), 1px, 5px window rounding
- **Linux packages**: hyprpaper, hyprlock, hypridle, waybar, wofi, alacritty, brave-bin, thunar, tmux, ripgrep, go, npm, postgresql
- **Windows**: requires Developer Mode or Admin for symlink creation; uses Scoop for git/neovim
