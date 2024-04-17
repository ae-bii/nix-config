{ pkgs, ... }:

{
    programs.neovim = {
        extraLuaConfig = ''
            vim.g.mapleader = " "
            vim.g.maplocalleader = " "
            vim.keymap.set("n", " ", "<NOP>")

            vim.keymap.set("n", "<Leader>h", ":noh<CR>")
        '';
    };
}
