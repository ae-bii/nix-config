{ config, pkgs, lib, ... }:

let
    fromGitHub = import ../functions/fromGitHub.nix;

    #treesitter-parsers = pkgs.symlinkJoin {
    #    name = "treesitter-parsers";
    #    paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
    #};
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
        #plugins = with pkgs.vimPlugins; [
            # nvim-lspconfig
            # nvim-treesitter.withAllGrammars
            # plenary-nvim
            # Adding outside plugins
            # (fromGitHub "HEAD" "elihunter173/dirbuf.nvim")
      #];
    };

    home.file = {
        "./.config/nvim/" = {
            source= ./nvim;
            recursive = true;
        };

        #"./.config/nvim/lua/config/init.lua" = {
        #    text = ''
        #        vim.opt.runtimepath:append("${treesitter-parsers}")
        #    '' + (builtins.readFile ./init.lua);
        #};

        #"./.local/share/nvim/nix/nvim-treesitter/" = {
        #    recursive = true;
        #    source = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
        #};
    };
}
