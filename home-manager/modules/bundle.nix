{
  imports = [
    ./git.nix
    { programs.alacritty.enable = true; }
    ./wms/hyprland.nix
    ./wms/waybar.nix
  ];
}
