{ outputs, config, pkgs, lib, ... }:

let
    fromGitHub = import ../functions/fromGitHub.nix;
in

{
    # Development
    home.packages = with pkgs; [
        unstable.libgcc
        lua
        lua52Packages.jsregexp
        stylua
        nodejs-slim_21
        (python311.withPackages (p: with p; [
            pip
            autopep8
            dbus-python
            pynvim
        ]))
        rustup
        texlive.combined.scheme-full
    ];

    programs.neovim = {
        enable = true;
        package = pkgs.neovim-nightly;
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

            lua-language-server
            marksman
            pyright
            ruff-lsp

            texlab
        ];
    };

    home.file = {
        "./.config/nvim/" = {
            source= ./nvim;
            recursive = true;
        };
    };
}
