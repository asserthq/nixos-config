{
  imports = [
    ./git.nix
    { programs.alacritty.enable = true; }
    ./wms/hyprland.nix
    ./hypridle.nix
    ./wms/waybar.nix
  ];
}
