{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.features.desktop.hyprland;
in {

  options.features.desktop.hyprland.enable = mkEnableOption "hyprland config";

  config = mkIf cfg.enable {    
    
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        # xwayland = {
        #   force_zero_scaling = true;
        # };

        monitor = [
          ",preferred,auto,auto"
        ];

        exec-once = [
          "ironbar"
          "hyprpaper"
          "hypridle"
          # "wl-paste -p -t text --watch clipman store -P --histpath=\"~/.local/share/clipman-primary.json\""
        ];

        env = [
          "XCURSOR_SIZE,32"
          # "WLR_NO_HARDWARE_CURSORS,1"
          # "GTK_THEME,Dracula"
        ];

        input = {
          kb_layout = "us, ru";
          # kb_options = "ctrl:nocaps";
          # follow_mouse = 1;

          touchpad = {
            natural_scroll = true;
            # workspace_swipe = false;
          };

          sensitivity = 0;
        };

        general = {
          # gaps_in = 8;
          # gaps_out = 12;
          # border_size = 3;
          # "col.active_border" = "rgba(9742b5ee) rgba(9742b5ee) 45deg";
          # "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };

        # cursor = {
        #   no_hardware_cursors = true;
        # };
        
        decoration = {
          rounding = 0;
          blur = {
            enabled = true;
            # size = 3;
            # passes = 2;
          };
          shadow = {
            enabled = true;
            # color = "rgba(1E202966)";
            # range = 20;
            # offset = "1 2";
            # render_power = 3;
            # scale = 0.97;
          };
        };

        animations = {
          enabled = true;

        };
        
        # dwindle = {
        #   pseudotile = true;
        #   preserve_split = true;
        # };

        master = {};

        "$mod" = "SUPER";

        bind = [
          "$mod, return, exec, kitty"
          "$mod, T, exec, kitty"
          # "$mod SHIFT, e, exec, kitty -e zellij_nvim"
          "$mod, o, exec, thunar"
          "$mod, Escape, exec, wlogout -p layer-shell"
          "$mod, Space, togglefloating"
          "$mod, Q, killactive"
          "$mod, M, exit"
          "$mod, F, fullscreen"
          "$mod, D, exec, wofi --show drun --allow-images"
          # "$mod, P, exec, wofi-pass"
          # "$mod SHIFT, P, pseudo"

          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"


          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, right, movewindow, r"
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, down, movewindow, d"
                    
          "$mod CTRL, left, resizeactive, -80 0"
          "$mod CTRL, right, resizeactive, 80 0"
          "$mod CTRL, up, resizeactive, 0 -80"
          "$mod CTRL, down, resizeactive, 0 80"

          "$mod ALT, left, moveactive,  -80 0"
          "$mod ALT, right, moveactive, 80 0"
          "$mod ALT, up, moveactive, 0 -80"
          "$mod ALT, down, moveactive, 0 80"        
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];      
      };
    };
    
    home.packages = with pkgs; [
      ironbar
      wofi
      hypridle
      hyprpaper
      hyprlock
    ];
  };
  
}
