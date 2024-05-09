{
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    # desktopManager.gnome.enable = true;
    # windowManager.herbstluftwm.enable = true;

    # displayManager = {
    #   autoLogin.enable = true;
    #   autoLogin.user = "amper";
    #   lightdm.enable = true;
    # };

    xkb = {
      layout = "us";
      variant = "";
    };

    
  };
}
