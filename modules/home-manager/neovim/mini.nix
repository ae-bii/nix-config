{ pkgs, ... }:

{
    programs.neovim = {
        plugins = with pkgs.vimPlugins; [
            mini-nvim
        ];
        extraLuaConfig = ''
            require('mini.completion').setup()
        '';
    };
}
