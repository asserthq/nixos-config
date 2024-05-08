{ config, ... }: {

  boot.loader = {
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
}
