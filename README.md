# My dotfiles for (Arch) Linux & macOS

## One liners

### Linux

`git clone https://github.com/antonkoetzler/dotfiles ~/.dotfiles && cd ~/.dotfiles && sudo pacman -S --needed stow && stow common linux && chmod +x linux/install.sh && ./linux/install.sh`

### MacOS

`git clone https://github.com/antonkoetzler/dotfiles ~/.dotfiles && cd ~/.dotfiles && brew install stow && stow common macos`

## Common and OS-specific files

### Common files (`./common`)

1. `.config/kitty`: Kitty
1. `.markdownlint.yaml`: This is for [my Neovim config](http://github.com/antonkoetzler/nvim-config)

### Linux (`./linux`)

1. `.config/hypr`: Hyprland
1. `.config/waybar`: Waybar
1. `.config/wofi`: Wofi
1. `.bashrc`: Bash configuration
1. `install.sh`: Installs dependencies for *everything* to work

### macOS (`./macos`)

1.  `.aerospace.toml`: Aerospace
1. `.zshrc`: Zsh shell
