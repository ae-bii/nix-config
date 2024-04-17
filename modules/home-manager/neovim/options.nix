{ pkgs, ... }:

{
    programs.neovim = {
        extraLuaConfig = ''
            vim.wo.number = true
            vim.wo.relativenumber = true
            vim.opt.expandtab = true
            vim.opt.tabstop = 4
            vim.opt.softtabstop = 4
            vim.opt.shiftwidth = 4

            -- Remap for completion
            inoremap <c-n> <tab>
            inoremap <c-y> <cr>
	'';
    };
}
