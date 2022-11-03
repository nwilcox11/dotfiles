local null_ok, null = pcall(require, "null-ls")
if not null_ok then
  return
end

local formatting_file_types = { "json", "javascript", "javascriptreact", "typescript", "typescriptreact" }
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null.builtins.diagnostics

null.setup({
  sources = {
    formatting.prettier.with({
      condition = function (utils)
        return utils.root_has_file({ "package.json" })
      end,
     filetypes = formatting_file_types
    }),
    -- diagnostics.eslint_d,
  },
})
