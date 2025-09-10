-- LSP configurations
return {
	-- Mason core
	{
		"mason-org/mason.nvim",
		opts = {}
	},

	-- Mason lsconfig
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
			}
		},
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "mason-org/mason.nvim", opts = {} },
		},
	},

	-- Nvim lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ 'mason-org/mason.nvim', opts = {} },
			'mason-org/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',

			-- Useful status updates for LSP.
			{ 'j-hui/fidget.nvim', opts = {} },

		},
		config = function()
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})
			-- Python
			lspconfig.pyright.setup({})
			-- Js/ts
			lspconfig.ts_ls.setup({})

			-- keymaps
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

			-- Show diagnostics as virtual text and underlines
			vim.diagnostic.config({
				virtual_text = true,   -- show message inline
				signs = true,          -- keep the "E"/"W" in the gutter
				underline = true,      -- underline the text with issues
				update_in_insert = false,
				severity_sort = true,
			})
		end
	},
}
