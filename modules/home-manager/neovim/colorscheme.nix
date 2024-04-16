{ pkgs, ... }:

{
    programs.neovim = {
        plugins = with pkgs.vimPlugins; [
            catppuccin-nvim
        ];
        extraLuaConfig = ''
            vim.o.termguicolors = true
            vim.cmd('colorscheme catppuccin-mocha')
        '';
    };
}
