# My (Arch) Linux home directory.

### TODO
1. Ricing `wofi`;
2. Ricing `sddm`;
3. Changing volume with laptop volume keys;
4. Wifi GUI.

### Dependencies for my configurations to work.
0. Install `yay`: `git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si; cd ..; rm -rf yay`
1. Principal dependencies: `yay -S sddm xf86-video-amdgpu mesa mesa-utils vulkan-radeon opencl-amd wayland waybar ttf-iosevka-nerd power-profiles-daemon pulseaudio pavucontrol udiskie hyprland hyprpaper wofi neovim livegrep firefox dolphin`
- `sddm`: Login manager;
- `xf86-video-amdgpu`, `mesa`, `mesa-utils`, `vulkan-radeon`, & `opencl-amd`: AMD drivers;
- `wayland`: Not an xorg configuration; `hyprland` uses `wayland`;
- `waybar`: Status bar;
- `ttf-iosevka-nerd`: Default font;
- `power-profiles-daemon`: For the power button menu to work in `waybar`;
- `pulseaudio` & `pavucontrol`: Audio managers;
- `udiskie`: Automatically mount USBs;
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
