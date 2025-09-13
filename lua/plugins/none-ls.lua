return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.diagnostics.stylelint,
			},
		})
		require("mason-null-ls").setup({
			automatic_installation = true,
		})
		vim.diagnostic.config({
			signs = true,
			virtual_text = true,
			update_in_insert = false,
		})
	end,
}
