{ config, ... }: {
  boot = {
    initrd.kernelModules = [ "nvidia" ];
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        configurationLimit = 27;
        device = "nodev";
        useOSProber = true;
        default = "2";
      };
    };
  };
}
