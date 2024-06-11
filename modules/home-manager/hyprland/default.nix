{ outputs, config, pkgs, lib, ... }:

{

    home.packages = with pkgs.unstable; [
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"];
        })
      )

      # notification daemon
      # eww
      # mako

      libnotify

      # wallpaper manager
      swww

      # app launcher
      # wmctrl
      # rofi-wayland
      fuzzel
      # tofi

      # Wireless
      overskride

      # audio
      pavucontrol

      # cursor
      phinger-cursors

      # screenshot
      grim
      slurp
      satty

      # clipboard
      wl-clipboard
      cliphist

      # gamma adjustment
      geoclue2
      gammastep
      brightnessctl

      # media control
      playerctl
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            monitor = [
                "eDP-1, 1920x1080@165,auto,1"
                "HDMI-A-1, 1920x1080@165,auto-right,auto,bitdepth,10"
            ];

            exec-once = [
                "waybar -c ~/nix-config/waybar/theme-config -s ~/nix-config/waybar/style.css"
                "swww init & swww img ~/nix-config/misc/wallpapers/minimal-earth.jpg"
                "mako"
                "aw-server"
                "wl-paste --watch cliphist store"
                "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
            ];

            env = [
                "XCURSOR_SIZE,24"
                "HYPRCURSOR_SIZE,24"
            ];

            general = {
                gaps_in = 2;
                gaps_out = 10;

                border_size = 2;

                # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
                "col.active_border" = "rgba(cba6f7aa) rgba(b4befeaa) 45deg";
                "col.inactive_border" = "rgba(595959aa)";

                # Set to true enable resizing windows by clicking and dragging on borders and gaps
                resize_on_border = false;

                # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
                allow_tearing = false;

                layout = "dwindle";
            };

            dwindle = {
                force_split = 2;
                pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                preserve_split = true; # You probably want this
                permanent_direction_override = true;
            };

            master = {
                new_is_master = true;
            };

            decoration = {
                rounding = 10;

                # Change transparency of focused and unfocused windows
                active_opacity = 1.0;
                inactive_opacity = 0.9;

                drop_shadow = true;
                shadow_range = 4;
                shadow_render_power = 3;
                "col.shadow" = "rgba(1a1a1aee)";

                # https://wiki.hyprland.org/Configuring/Variables/#blur
                blur = {
                    enabled = true;
                    size = 6;
                    passes = 3;
                    new_optimizations = true;
                    ignore_opacity = true;
                    xray = false;
                    vibrancy = 0.1696;
                };
            };

            animations = {
                enabled = true;

                # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
                bezier = [
                    "myBezier, 0.05, 0.9, 0.1, 1.05"
                ];
                animation = [
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 7, default, popin 80%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 6, default"
                ];
            };

            misc = {
                force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
                disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
                disable_splash_rendering = true;
            };

            input = {
                kb_layout = "us";
                kb_variant = "colemak_dh";

                repeat_delay = 200;
                repeat_rate = 40;

                follow_mouse = 1;

                sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

                touchpad = {
                    natural_scroll = false;
                };
            };

            gestures = {
                workspace_swipe = false;
            };

            windowrulev2 = [
                "float, title:^(Picture-in-Picture)$"
                "pin, title:^(Picture-in-Picture)$"
                "move 67% 72%, title:^(Picture-in-Picture)$"
                "size 33% 28%, title:^(Picture-in-Picture)$"
            ];

            "$mainMod" = "SUPER";
            bind =
                [
                    # Hyprland
                    "$mainMod SHIFT, W, killactive,"
                    "$mainMod SHIFT, M, exit,"
                    "$mainMod, T, togglefloating,"
                    "$mainMod, P, pseudo, # dwindle"
                    # bind = $mainMod, J, togglesplit, # dwindle
                    "$mainMod, F, fullscreen,"
                    "$mainMod SHIFT, S, exec, grim -g \"$(slurp -o -r)\" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"
                    # bind = , mouse:274, exec, ;

                    # Terminal
                    "$mainMod, RETURN, exec, kitty"

                    # Apps
                    "$mainMod, N, exec, dolphin"
                    "$mainMod, B, exec, firefox"
                    "$mainMod, D, exec, webcord"

                    # Rofi
                    "$mainMod, Space, exec, fuzzel"

                    # Waybar Reload
                    "$mainMod SHIFT, B, exec, ~/nix-config/waybar/launch.sh"

                    # Move focus with mainMod + arrow keys
                    "$mainMod, h, movefocus, l"
                    "$mainMod, l, movefocus, r"
                    "$mainMod, k, movefocus, u"
                    "$mainMod, j, movefocus, d"
                    "$mainMod SHIFT, h, movewindow, l"
                    "$mainMod SHIFT, l, movewindow, r"
                    "$mainMod SHIFT, k, movewindow, u"
                    "$mainMod SHIFT, j, movewindow, d"

                    # Scroll through existing workspaces with mainMod + scroll
                    "$mainMod, mouse_down, workspace, e+1"
                    "$mainMod, mouse_up, workspace, e-1"
                ]
                ++ (
                # workspaces
                # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
                    builtins.concatLists (builtins.genList (
                        x: let
                            ws = let
                                c = (x + 1) / 10;
                            in
                                builtins.toString (x + 1 - (c * 10));
                        in [
                            "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
                            "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                        ]
                    )
                    10)
                );
            bindm = [
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];
            bindl = [
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ", XF86AudioPlay, exec, playerctl play-pause" # the stupid key is called play , but it toggles 
                ", XF86AudioNext, exec, playerctl next"
                ", XF86AudioPrev, exec, playerctl previous"
            ];
            bindel = [
                ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
                ", XF86MonBrightnessUp, exec, brightnessctl set 1%+"
                ", XF86MonBrightnessDown, exec, brightnessctl set 1%-"
            ];
        };
    };

}
