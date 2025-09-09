-- Telescope
return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.5',
  dependences = { 'nvim-lua/plenary.nvim' },
	keys = {
		{"<leader>ff", "<cmd>Telescope find_files<cr>", mode="n", desc="Find files in cwd"},
		{"<leader>fg", "<cmd>Telescope live_grep<cr>", mode="n", desc="Live text search across cwd"},
		{"<leader>fb", "<cmd>Telescope buffers<cr>", mode="n", desc="Search open buffers"},
		{"<leader>fh", "<cmd>Telescope help_tags<cr>", mode="n", desc="Search Neovim help docs."},
	}
}
