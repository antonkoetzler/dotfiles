# My (Arch) Linux home directory.

### Dependencies for my configurations to work
1. `pacman -S sddm neovim ripgrep hyprland waybar swww dunst wofi`: Package depdencies;
- `sddm`: Login manager;
- `neovim`: The best text editor on the planet;
- `ripgrep`: Search by character in Neovim;
- `hyprland`: Tiling window manager;
- `waybar`: Status bar for Hyprland;
- `swww`: Setting background images in Hyprland;
- `dunst`: Notifications;
- `wofi`: Application search menu.
2. `sudo systemctl enable sddm`: Enable SDDM, my login manager.

### Table of contents
1. Bash configuration: `./.bashrc`;
2. Hyprland tiling window manager configuration: `./.config/hypr`;
3. Neovim configuration: `./.config/nvim`.

### Things to remember
1. Setting wallpaper.
- `swww init`;
- `swww img <path>`.
