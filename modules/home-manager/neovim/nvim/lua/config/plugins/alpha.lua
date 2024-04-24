-- alpha greeter
-- https://github.com/goolord/alpha-nvim

local header = {
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
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

local icons = {
	autocomplete = {
		Text = "󰦨 ",
		Method = "󰅲 ",
		Function = "󰊕 ",
		Constructor = " ",
		Field = " ",
		Variable = "󰫧 ",
		Class = "󰠱 ",
		Interface = " ",
		Module = " ",
		Property = " ",
		Unit = " ",
		Value = "󰎠 ",
		Enum = " ",
		Keyword = "󰌋 ",
		Snippet = " ",
		Color = "󰏘 ",
		File = "󰈙 ",
		Reference = "",
		Folder = "󰉋",
		EnumMember = " ",
		Constant = "󰏿 ",
		Struct = " ",
		Event = " ",
		Operator = "󰆕 ",
		TypeParameter = " ",
	},
	diagnostics = {
		DiagnosticSignError = "",
		DiagnosticSignWarn = "",
		DiagnosticSignInfo = "",
		DiagnosticSignHint = "󰌵 ",
	},
	dashboard = {
		NewFile = "󰝒",
		FindFile = "󰱼",
		FindText = "󱎸",
		RestoreSession = "󰁯",
		Settings = "",
		Quit = "󰄛",
	},
	statusline = { "", "", "╲", "╱" },
	-- statusline = { "", "", "╲╲", "╲╲" },
	-- statusline = { "▓▒░", "░▒▓", "░", "░" },
}

return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local alpha = require("alpha")
			-- local alpha_th = require("alpha.themes.theta")
			local alpha_db = require("alpha.themes.dashboard")
			local alpha_time = tostring(os.date("%A %I:%M %p"))

			-- Set header
			alpha_db.section.header.val = header
			alpha_db.section.buttons.val = {
				{
					type = "text",
					val = "╭" .. string.rep("─", 48 - string.len(alpha_time)) .. alpha_time .. "╮",
					opts = { hl = "FloatBorder", position = "center" },
				},
				-- alpha_db.button("e", icons.dashboard.NewFile .. "  New file", ":ene <BAR> startinsert <CR>"),
				alpha_db.button("SPC s f", icons.dashboard.FindFile .. "  Find file", ":Telescope find_files <CR>"),
				alpha_db.button("SPC s g", icons.dashboard.FindText .. "  Find text", ":Telescope live_grep <CR>"),
				-- alpha_db.button("r", icons.dashboard.RestoreSession .. "  Restore session", ":lua SessionLoad() <CR>"),
				alpha_db.button("s", icons.dashboard.Settings .. "  Settings", ":e ~/.config/nvim/init.lua<CR>"),
				alpha_db.button("q", icons.dashboard.Quit .. "  Quit", ":qa<CR>"),
				{
					type = "text",
					val = "╰" .. string.rep("─", 48) .. "╯",
					opts = { hl = "FloatBorder", position = "center" },
				},
			}

			-- Send config to alpha
			alpha.setup(alpha_db.config)
		end,
	},
}
