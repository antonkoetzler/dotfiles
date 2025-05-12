# Dotfiles for (Arch) Linux & macOS

## Common and OS-specific files

### Common files

1. `.config/kitty/*`: Kitty
1. `scripts/*`: Personal scripts
1. `.markdownlint.yaml`: This is for [my Neovim config](http://github.com/antonkoetzler/nvim-config)

### (Arch) Linux

1. `.config/hypr`: Hyprland
1. `.config/waybar`: Waybar
1. `.config/wofi`: Wofi
1. `.config/xdg-desktop-portal`: Lets sandboxed apps safely access system features
1. `.bashrc`: Bash shell
1. `install_dependencies.sh`: Installs dependencies for *everything* to work

### macOS

1.  `.aerospace.toml`: Aerospace
1. `.zshrc`: Zsh shell

## Known problems and fixes

- (Arch) Linux: Brave is super slow when focused: Go to `brave://flags` and set `Preferred Ozone platform` to `Wayland`.

## TODO

- (Arch) Linux: Add the power daemon profiles found in the default wayland config so i can have low power mode on my laptop.
