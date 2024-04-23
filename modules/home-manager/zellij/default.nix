{ config, pkgs, lib, ... }:

{
    programs.zellij = {
        enable = true;
        enableZshIntegration = true;
    };

    home.file = {
        "./.config/zellij/" = {
            source= ./configs;
            recursive = true;
        };
    };
}
