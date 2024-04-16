{ config, pkgs, lib, ...}:

let
    fromGitHub = import ../functions/fromGitHub.nix;
in

{
    imports = [
        ./colorscheme.nix
	./options.nix
    ];
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        plugins = with pkgs.vimPlugins; [
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            plenary-nvim
            mini-nvim
            # Adding outside plugins
            # (fromGitHub "HEAD" "elihunter173/dirbuf.nvim")
      ];
    };
}
