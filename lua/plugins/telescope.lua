-- Telescope
return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n", desc = "Find files in cwd" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Live text search across cwd" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n", desc = "Search open buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n", desc = "Search Neovim help docs." },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"%.o$",
						"%.obj$",
						"%.a$",
						"%.so$",
						"%.out$",
						"%.d$",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			telescope.load_extension("ui-select")
		end,
	},
}
