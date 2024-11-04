local null = require("null-ls")

local formatting_file_types = { "json", "javascript", "javascriptreact", "typescript", "typescriptreact" }
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null.builtins.diagnostics


null.setup({
  sources = {
    formatting.prettier.with({
      filetypes = formatting_file_types
    }),
    -- Note: If eslint_d stops working, make sure project local eslint version, and eslint_d version are in sync.
    -- diagnostics.eslint_d
    diagnostics.eslint
  }
})
