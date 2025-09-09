-- Telescope
return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependences = { 'nvim-lua/plenary.nvim' },
		keys = {
			{"<leader>ff", "<cmd>Telescope find_files<cr>", mode="n", desc="Find files in cwd"},
			{"<leader>fg", "<cmd>Telescope live_grep<cr>", mode="n", desc="Live text search across cwd"},
			{"<leader>fb", "<cmd>Telescope buffers<cr>", mode="n", desc="Search open buffers"},
			{"<leader>fh", "<cmd>Telescope help_tags<cr>", mode="n", desc="Search Neovim help docs."},
		}
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		opts = {},
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
								-- even more opts
						}
					}
				}
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end
	}
}
