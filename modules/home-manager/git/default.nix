{ config, pkgs, lib, ... }:

{
    programs.git = {
        enable = true;
        userName = "Anupam Bhakta";
        userEmail = "anupambhakta1@gmail.com";
        extraConfig = {
            init.defaultBranch = "master";
        };
    };
}

