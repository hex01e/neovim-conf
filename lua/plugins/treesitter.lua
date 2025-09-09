-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = { "lua", "python", "javascript", "html", "css", "json", "bash", "typescript", "tsx" },
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			auto_install = true,
		}
	end,
}
