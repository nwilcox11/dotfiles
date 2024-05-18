require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "denols", "lua_ls", "rust_analyzer", "gopls", "pyright" },
})

local lsp = require("lspconfig")

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.name == "tsserver" or client.name == "gopls" then
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
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
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
      -- Do not send telemetry data containing a randomized but unique identifierlsp
      telemetry = {
        enable = false,
      },
    },
  },
}

lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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

lsp.gopls.setup {
  on_attach = on_attach,
  root_dir = lsp.util.root_pattern("go.work", "go.mod", "git")
}

lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_pattern = lsp.util.root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.cjs', 'postcss.config.mjs', 'postcss.config.ts')
}

lsp.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lsp.rust_analyzer.setup {
  on_attach = function (client, bufnr)
    vim.lsp.inlay_hint.enable(true)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

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
    source = true,
    border = "rounded",
  }
})
