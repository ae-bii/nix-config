{ config, pkgs, lib, ... }:

{
    programs.zellij = {
        enable = true;
        enableZshIntegration = true;
    };

    home.file = {
        "./.config/zellij/config.kdl" = {
            source= ./config.kdl;
        };
    };
}
