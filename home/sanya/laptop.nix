{ config, ... }: {

  imports = [
    ../common
    ../features/cli
    ../features/desktop
    ./home.nix
  ];

  features = {
    cli = {
      fish.enable = true;
      fzf.enable = true;  
    };
    desktop = {
      wayland.enable = true;
    };
  };
  
}
