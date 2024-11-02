# My (Arch) Linux home directory.

### TODO
1. Ricing `wofi`;
2. Ricing `sddm`;
3. Changing volume with laptop volume keys;
4. Wifi GUI.

### Dependencies for my configurations to work.
1. Principal dependencies: `pacman -S sddm xf86-video-amdgpu mesa mesa-utils vulkan-radeon opencl-amd wayland waybar ttf-iosevka-nerd power-profiles-daemon pulseaudio pavucontrol hyprland hyprpaper wofi neovim livegrep firefox dolphin`
- `sddm`: Login manager;
- `xf86-video-amdgpu`, `mesa`, `mesa-utils`, `vulkan-radeon`, & `opencl-amd`: AMD drivers;
- `wayland`: Not an xorg configuration; `hyprland` uses `wayland`;
- `waybar`: Status bar;
- `ttf-iosevka-nerd`: Default font;
- `power-profiles-daemon`: For the power button menu to work in `waybar`;
- `pulseaudio`: Audio manager;
- `pavucontrol`: Audio manager with `pulseaudio`;
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
