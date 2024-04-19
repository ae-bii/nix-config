{ config, pkgs, lib, ... }:

{
    programs.git = {
        enable = true;
        userName = "ae-bii";
        userEmail = "anupambhakta1@gmail.com";
        extraConfig = {
            init.defaultBranch = "master";
        };
    };
}

