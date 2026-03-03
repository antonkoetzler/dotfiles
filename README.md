# My dotfiles for Arch Linux, macOS & Windows

## One liners

### Linux

```bash
curl -fsSL https://raw.githubusercontent.com/antonkoetzler/dotfiles/main/linux/install.sh | bash
```

#### Dry run
```bash
curl -fsSL https://raw.githubusercontent.com/antonkoetzler/dotfiles/main/linux/install.sh | bash -s -- --dry-run
```

### macOS

```bash
curl -fsSL https://raw.githubusercontent.com/antonkoetzler/dotfiles/main/macos/install.sh | bash
```

#### Dry run
```bash
curl -fsSL https://raw.githubusercontent.com/antonkoetzler/dotfiles/main/macos/install.sh | bash -s -- --dry-run
```

### Windows

> Requires Developer Mode (Settings → System → For developers) or running PowerShell as Administrator.

```powershell
irm https://raw.githubusercontent.com/antonkoetzler/dotfiles/main/windows/install.ps1 | iex
```

#### Dry run
```powershell
& ([ScriptBlock]::Create((irm 'https://raw.githubusercontent.com/antonkoetzler/dotfiles/main/windows/install.ps1'))) -DryRun
```

## Common and OS-specific files

### Common (`./common`)

1. `.config/alacritty`: Alacritty terminal (themes cloned separately from [alacritty/alacritty-theme](https://github.com/alacritty/alacritty-theme))
1. `.tmux.conf`: tmux
1. `.markdownlint.yaml`: For [my Neovim config](http://github.com/antonkoetzler/nvim-config)

### Linux (`./linux`)

1. `.config/hypr`: Hyprland
1. `.config/waybar`: Waybar
1. `.config/wofi`: Wofi
1. `.bashrc`: Bash configuration
1. `install.sh`: Installs dependencies for *everything* to work

### macOS (`./macos`)

1. `.aerospace.toml`: AeroSpace
1. `.zshrc`: Zsh shell
1. `install.sh`: Installs dependencies

### Windows (`./windows`)

1. `install.ps1`: Installs dependencies and symlinks `common/` into `%USERPROFILE%`
