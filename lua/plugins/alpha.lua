-- Alpha-nvim
return   {
	"goolord/alpha-nvim",
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-lua/plenary.nvim'

	},
	config = function()
		local alpha = require("alpha")
		local theme = require("alpha.themes.dashboard")

		local header = theme.section.header
		header.opts = {
			position = 'center'
		}
		header.val = {
			[[     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
			[[                           Welcome                         ]],
		}

		-- Add buttons with correct keybindings and icons
		theme.section.buttons.val = {
			theme.button("e", "  󰈞  New file", ":ene <BAR> startinsert <CR>"),
			theme.button("ff", "  󰈞  Find file", ":Telescope find_files <CR>"),
			theme.button("fg", "  󰈬  Find text", ":Telescope live_grep <CR>"),
			theme.button("fb", "  󰈔  Find buffer", ":Telescope buffers <CR>"),
			theme.button("q", "  󰗼  Quit", ":qa<CR>"),
		}

		alpha.setup(theme.config)
  end,
}
