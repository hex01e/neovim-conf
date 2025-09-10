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
			[[ ███╗   ██╗███████╗██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
			[[                  Welcome                  ]],
		}

		alpha.setup(theme.config)
  end,
}
