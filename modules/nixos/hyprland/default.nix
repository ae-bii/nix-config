 { inputs, pkgs, config, libs, ... }:

 {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;

      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      waybar
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"];
        })
      )

      # notification daemon
      # eww
      mako

      libnotify

      # wallpaper manager
      swww

      # app launcher
      rofi-wayland
    ];

    environment.sessionVariables = {
      # WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk ];

    # home.file = {
    #   "./.config/hypr/" = {
    #     source = ./configs;
    #     recursive = true;
    #   };
    # };
 }