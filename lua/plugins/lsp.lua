return {
  -- Mason core
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "ruff",
          "html",
          "cssls",
        },
      })
    end,
  },

  -- LSP core (modern Neovim API: vim.lsp.config + vim.lsp.enable)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- helper to enable a server config then enable it
      local function define_and_enable(name, cfg)
        cfg = cfg or {}
        cfg.capabilities = cfg.capabilities or capabilities
        -- define/merge the LSP configuration
        vim.lsp.config(name, cfg)
        -- tell Neovim to auto-start/enable that server
        vim.lsp.enable({ name })
      end

      -- lua specific settings (keeps your runtime/workspace config)
      define_and_enable("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = {
                vim.fn.expand("$VIMRUNTIME/lua"),
                vim.fn.stdpath("config") .. "/lua",
              },
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- standard servers with default capabilities
      define_and_enable("pyright")
      define_and_enable("ts_ls")
      define_and_enable("html")
      define_and_enable("cssls")

      -- Ruff: ruff/ruff-lsp may be installed by Mason as 'ruff' or 'ruff-lsp'
      -- mason-lspconfig maps names; use 'ruff' as you had before
      define_and_enable("ruff")

      -- Keymaps (global LSP keymaps)
      local bufmap = function(mode, lhs, rhs, desc)
        if desc then
          desc = "LSP: " .. desc
        end
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
      bufmap("n", "<leader>F", function()
        vim.lsp.buf.format()
      end, "Format")
    end,
  },

  {
    "j-hui/fidget.nvim",
    opts = {},
  },
}

