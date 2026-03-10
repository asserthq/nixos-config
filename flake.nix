{
  description = ''
    For questions just DM me on X: https://twitter.com/@sanya
    There is also some NIXOS content on my YT channel: https://www.youtube.com/@sanya

    One of the best ways to learn NIXOS is to read other peoples configurations. I have personally learned a lot from Gabriel Fontes configs:
    https://github.com/Misterio77/nix-starter-configs
    https://github.com/Misterio77/nix-config

    Please also check out the starter configs mentioned above.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    grub2-themes.url = "github:vinceliuice/grub2-themes";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    elephant.url = "github:abenz1267/elephant";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    ...
  } @ inputs: {
    
    # overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/laptop
          inputs.grub2-themes.nixosModules.default
        ];
      };
    };

    homeConfigurations = {
      "sanya@laptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { hostPlatform = "x86_64-linux"; };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home/sanya/laptop.nix
        ];
      };
    };
  };
}
