{ config, pkgs, lib, ... }:

let
    fromGitHub = import ../functions/fromGitHub.nix;
in

{
    # Development
    home.packages = with pkgs; [
        gcc
        lua
        lua52Packages.jsregexp
        stylua
        nodejs-slim_21
        ruff
        (python311.withPackages (p: with p; [
            pip
            autopep8
            black
            isort
            dbus-python
            pynvim
        ]))
        rustup
        texlive.combined.scheme-full
    ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        coc.enable = false;
        extraPackages = with pkgs; [
            python311Packages.flake8
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
