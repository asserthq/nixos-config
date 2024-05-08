{ pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.bash;

    users.sanya = {
      isNormalUser = true;
      description = "Aleksandr";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
      packages = with pkgs; [];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "sanya";
}
