{
  services.xserver = {
    enable = true;
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

    libinput = {
      enable = true;
      #mouse.accelProfile = "flat";
      #touchpad.accelProfile = "flat";
    };

    videoDrivers = [ "nvidia" ];
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    #desktopManager.gnome.enable = true;
  };
}
