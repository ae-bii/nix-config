-- vimtex
-- https://github.com/lervag/vimtex

return {
	{
		"lervag/vimtex",
		ft = "tex",
		config = function()
			local g = vim.g
			g.tex_flavor = "latex"
			g.vimtex_view_method = "zathura"
			g.vimtex_view_skim_sync = 1
			g.vimtex_view_skim_activate = 1
			g.vimtex_compiler_method = "latexmk"
			g.vimtex_mappings_enabled = true
			g.vimtex_syntax_enabled = 0
			-- Do not auto open quickfix on compile errors
			g.vimtex_quickfix_mode = 0
			-- vimtex toc options
			g.vimtex_toc_config = {
				split_pos = "rightbelow",
				split_width = 20,
				show_help = 0,
			}
			-- Latex warnings to ignore
			-- g.vimtex_quickfix_ignore_filters = {
			-- 	"Command terminated with space",
			-- 	"LaTeX Font Warning: Font shape",
			-- 	"Package caption Warning: The option",
			-- 	[[Underfull \\hbox (badness [0-9]*) in]],
			-- 	"Package enumitem Warning: Negative labelwidth",
			-- 	[[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in]],
			-- 	[[Package caption Warning: Unused \\captionsetup]],
			-- 	"Package typearea Warning: Bad type area settings!",
			-- 	[[Package fancyhdr Warning: \\headheight is too small]],
			-- 	[[Underfull \\hbox (badness [0-9]*) in paragraph at lines]],
			-- 	"Package hyperref Warning: Token not allowed in a PDF string",
			-- 	[[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines]],
			-- }
		end,
	},
}
