{ config, pkgs, lib, ... }:

{
    programs.tmux = {
        enable = true;
        terminal = "tmux-256color";
        clock24 = true;
        keyMode = "vi";
        shortcut = "a";

        plugins = with pkgs; [
            {
                plugin = tmuxPlugins.catppuccin;
                extraConfig = '' 
                    set -g @catppuccin_flavour 'mocha'
                    set -g @catppuccin_window_tabs_enabled on
                    set -g @catppuccin_date_time "%H:%M"
                    '';
            }
        ];

        extraConfig = ''
            set -g default-terminal "tmux-256color"
        '';
    };
}
