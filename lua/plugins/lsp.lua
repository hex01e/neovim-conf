return {
	-- Mason core
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require('mason').setup()
		end
	},
	-- Mason lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { 'lua_ls', 'pyright', 'ts_ls' }
			})
		end
	},
	-- LSP core
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')

			lspconfig.lua_ls.setup({})

			-- Keymaps
			local bufmap = function(mode, lhs, rhs, desc)
				if desc then desc = "LSP: " .. desc end
				vim.keymap.set(mode, lhs, rhs, { desc = desc })
			end

			bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
			bufmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
			bufmap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
			bufmap("n", "gr", vim.lsp.buf.references, "References")
			bufmap("n", "K", vim.lsp.buf.hover, "Hover docs")
			bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
			bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
			bufmap("n", "<leader>dp", vim.diagnostic.goto_prev, "Prev diagnostic")
			bufmap("n", "<leader>dn", vim.diagnostic.goto_next, "Next diagnostic")
			bufmap("n", "<leader>F", function() vim.lsp.buf.format() end, "Format")
		end
	}
}
