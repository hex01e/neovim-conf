-- None-ls
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Python
				null_ls.builtins.formatting.black,

				-- JS/TS/HTML/CSS/Markdown
				null_ls.builtins.formatting.prettier,
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {desc="format the buffer"})
	end,
}
