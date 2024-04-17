{ pkgs, ... }:

{
    programs.neovim = {
        plugins = with pkgs.vimPlugins; [
            mini-nvim
        ];
        extraLuaConfig = ''
            require('mini.align').setup()
            require('mini.comment').setup()
            require('mini.completion').setup()
            require('mini.cursorword').setup()
            require('mini.pairs').setup()
            require('mini.splitjoin').setup()
            require('mini.statusline').setup()
            require('mini.surround').setup()
            require('mini.trailspace').setup()
        '';
    };
}
