# My (Arch) Linux home directory.

### Dependencies for my configurations to work.
1. Principal dependencies: `pacman -S sddm wayland waybar ttf-iosevka-nerd power-profiles-daemon pulseaudio hyprland hyprpaper wofi neovim livegrep firefox dolphin`
- `wayland`: Not an xorg configuration; `hyprland` uses `wayland`;
- `waybar`: Status bar;
- `ttf-iosevka-nerd`: Default font;
- `power-profiles-daemon`: For the power button menu to work in `waybar`;
- `pulseaudio`: Audio manager;
- `hyprland`: Our tiling window manager;
- `wofi`: Application launcher;
- `neovim`: Text editor;
- `livegrep`: For fuzzy finding in `neovim`;
- `firefox`: Default browser;
- `dolphin`: File manager.
2. `sudo systemctl enable sddm`: Enable the login manager;
3. `sudo systemctl enable power-profiles-daemon`: Enables the `power-profiles-daemon`.

### Table of contents of my configurations.
1. `hyprland` tiling window manager: `./.config/hypr`;
2. `waybar` status bar: `./.config/waybar`;
3. Bash: `./.bashrc`;
4. Neovim: `./.config/nvim`.
