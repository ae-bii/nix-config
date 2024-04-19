{ config, pkgs, lib, ... }:

let
    fromGitHub = import ../functions/fromGitHub.nix;
in

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        coc.enable = false;
        extraPackages = with pkgs; [
            tree-sitter
            fzf
            gcc
            gnumake
            wget
        ];
    };

    home.file = {
        "./.config/nvim/" = {
            source= ./nvim;
            recursive = true;
        };
    };
}
