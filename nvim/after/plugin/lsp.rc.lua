require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "denols", "sumneko_lua", "rust_analyzer", "gopls" },
})

local lsp = require("lspconfig")

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false, silent = true }

  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", "<Cmd> lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.sumneko_lua.setup {
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
        globals = { 'vim' },
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
  focusable = false,
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
  signs = true,
  float = {
    source = "always",
  }
})
