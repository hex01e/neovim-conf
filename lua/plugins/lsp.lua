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
		config = function()
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({})
			-- Python
			-- Use Virtial env if exist
			local function has_venv(settings)
				local venv_path = vim.fn.getcwd().."/.venv/bin/python"
				if vim.uv.fs_stat(venv_path) then
					settings.python = settings.python or {}
					settings.python.pythonPath = venv_path
				end
				return settings
			end
			-- Python configs
			lspconfig.pyright.setup({
				settings = has_venv({})
			})
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
