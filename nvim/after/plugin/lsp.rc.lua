require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = false,
  ensure_installed = { "lua_ls", "rust_analyzer" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config['lua_ls'] = {
  capabilities = capabilities,
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
      diagnostics = {
        globals = { 'vim', 'P' },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library"
        },
        checkThirdParty = false
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.config["rust_analyzer"] = {
  on_attach = function()
    vim.lsp.inlay_hint.enable(true)
  end,

  name = "rust_analyzer",
  capabilities = capabilities,
  cmd = { vim.fn.expand("~/.cargo/bin/rust-analyzer") },
  filetypes = { "rust" },
  root_markers = { "cargo.toml" },
}

vim.lsp.config['typescript-language-server'] = {
  capabilities = capabilities,
  cmd = { 'typescript-language-server' },
  filetypes = { "typescript", "javascript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json" },
}

vim.lsp.enable({ "lua_ls", "rust_analyzer", "typescript-language-server" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function (ev)
    local opts = { buffer = 0, remap = false }

    assert(vim.lsp.get_client_by_id(ev.data.client_id), "Missing valid Lsp client")

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  end
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    current_line = true,
  },
  underline = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "●",
      [vim.diagnostic.severity.WARN] = "●",
      [vim.diagnostic.severity.HINT] = "●",
      [vim.diagnostic.severity.INFO] = "●",
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
  },
  float = {
    source = true,
    border = "rounded",
  }
})
