# My (Arch) Linux setup.

## Contains
1. Login manager & tiling window manager configuration;
2. Bash configuration;
3. Other packages I use.

### Getting the login manager & tiling window manager working.
0. Install `yay`;
`git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si; cd ..; rm -rf yay`
1. Principal dependencies;
`yay -S sddm wayland waybar ttf-iosevka-nerd hyprland hyprpaper wofi`
- `sddm`: Login manager;
- `wayland`: Not an xorg configuration; `hyprland` uses `wayland`;
- `waybar`: Status bar;
- `ttf-iosevka-nerd`: Default font;
- `hyprland`: Our tiling window manager;
- `wofi`: Application launcher;
2. Enabling systemd services;
- `sudo systemctl enable sddm`: Enable the login manager;
- `sudo systemctl enable power-profiles-daemon`: Enables the `power-profiles-daemon`;
- `sudo systemctl enable NetworkManager`: Enables `network-manager`;
3. My SDDM theme is maldives, so edit `/lib/sddm/sddm.conf.d/default.conf` to set maldives as your current theme;
4. Install `xdg-desktop-portal-hyprland` to compatibility in applications, ensuring a smooth and speedy `hyprland` experience.
- `yay -S gbm hyprland-protocols hyprlang hyprutils hyprwayland-scanner libdrm sdbus-cpp wayland-protocols; cd ~/Downloads; git clone --recursive https://github.com/hyprwm/xdg-desktop-portal-hyprland; cd xdg-desktop-portal-hyprland/; cmake -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -B build; cmake --build build; sudo cmake --install build`

### Other packages I use for the configuration to work completely (also just main programs like browser, editor, etc).
`sudo yay -S xf86-video-amdgpu mesa mesa-utils vulkan-radeon opencl-amd neovim livegrep kitty firefox dolphin grim slurp udiskie power-profiles-daemon pulseaudio pavucontrol network-manager brightnessctl gnome-disk-utility git-completion`
- `xf86-video-amdgpu`, `mesa`, `mesa-utils`, `vulkan-radeon`, & `opencl-amd`: AMD drivers;
- `neovim`: Text editor;
- `livegrep`: For fuzzy finding in `neovim`;
- `kitty`: Terminal;
- `firefox`: Default browser;
- `dolphin`: File manager;
- `grim` & `slurp`: For screenshots;
- `udiskie`: Automatically mount USBs;
- `power-profiles-daemon`: For the power button menu to work in `waybar`;
- `pulseaudio` & `pavucontrol`: Audio managers;
- `network-manager`: Network manager, use `nmtui` to connect to networks;
- `brightnessctl`: Brightness control on laptops;
- `gnome-disk-utility`: For browsering disk space;
- `git-completion`: Git tab completion on things such as branches.

### Table of contents of what is in `~/.config`.
1. `hyprland` tiling window manager: `./.config/hypr`;
2. `waybar` status bar: `./.config/waybar`;
3. `wofi` application launcher: `./.config/wofi`;
5. kitty terminal: `./.config/kitty`;
6. Neovim: `./.config/nvim`.
