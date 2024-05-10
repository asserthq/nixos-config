{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    firefox-wayland
    telegram-desktop
    alacritty
    kitty
    
    # CLI utils
    helix
    neofetch
    wget
    git
    fastfetch
    swww
    openssl

    # XDG stuff
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Xorg stuff
    #xterm
    #xclip
    #xorg.xbacklight

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist
    wlr-randr

    # WMs and stuff
    hyprland
    hypridle
    hyprlock
    hyprpicker
    hyprland-protocols
    hyprpaper
    waybar

    # Sound
    pipewire
    pulseaudio
    pamixer

    # GPU stuff 
    libva-utils
    nvidia-vaapi-driver

    # Other
    home-manager
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
