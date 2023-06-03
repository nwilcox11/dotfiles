require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "denols", "lua_ls", "rust_analyzer", "gopls" },
})

local lsp = require("lspconfig")

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'P' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lsp.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc", "deno_root"),
}

lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  single_file_support = false,
  root_dir = lsp.util.root_pattern("package.json", "tsconfig.json"),
}

lsp.rust_analyzer.setup {}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local signs = {
  Error = '●', Warn = '●', Hint = "●", Info = "●"
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  underline = false,
  signs = true,
  float = {
    source = "always",
    border = "rounded",
  }
})
