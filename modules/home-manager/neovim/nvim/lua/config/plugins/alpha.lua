-- alpha greeter
-- https://github.com/goolord/alpha-nvim

return {
	{
		"goolord/alpha-nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			-- Set header
			dashboard.section.header.val = {
				"",
				"",
				"",
				"",
				"",
				"",
				"      |\\      _,,,---,,_",
				"ZZZzz /,`.-'`'    -.  ;-;;,_",
				"     |,4-  ) )-,_. ,\\ (  `'-'",
				"    '---''(_/--'  `-'\\_)  ",
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)
		end,
	},
}
