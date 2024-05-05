{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        zjstatus
    ];
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
