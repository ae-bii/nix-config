{ pkgs, ... }:

{
    programs.neovim = {
        extraLuaConfig = ''
	    vim.g.mapleader = "<Space>"

            vim.keymap.set("i", "<C-n>", "<Tab>")
            vim.keymap.set("i", "<C-y>", "<CR>")
	'';
    };
}
