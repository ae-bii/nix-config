{ config, pkgs, lib, ... }:

{
    programs.zellij = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            theme = "catppuccin-mocha";
        };
    };
}
