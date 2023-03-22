local has_lsp, lsp = pcall(require, "lspconfig")
local cmp_nvim_lsp = require'cmp_nvim_lsp'

if has_lsp then
  local lsp_keymaps = function(bufnr)
      local keymap = vim.api.nvim_buf_set_keymap
      local opts = { noremap = true, silent = true }
      keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
      keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
      keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      -- Rename in buffer TODO: this doesn't work well.
      keymap(bufnr, "n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
      -- Diagnostics
      keymap(bufnr, "n", "<Leader>ds", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
      -- Format
      keymap(bufnr, "n", "<Leader>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
      client.resolved_capabilities.document_formatting = false
    end

    if client.name == "sumneko_lua" then
      client.resolved_capabilities.document_formatting = false
    end

    lsp_keymaps(bufnr)
  end

  -- Gutter signs
  local signs = {
    Error = '●', Warn = '●', Hint = "●", Info = "●"
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local diagnostic_config = {
    virtual_text = {
      -- spacing = 2,
      prefix = '●',
    },
    signs = {
      active = signs,
    },
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    }
}
  vim.diagnostic.config(diagnostic_config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

  -- Enable the following Lsp's
  local servers = { "clangd", "pyright", "tsserver", "gopls" }

  for _, s in ipairs(servers) do
    lsp[s].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end

  lsp.astro.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    typescript = {
      serverPath = "./usr/local/bin/tsserver"
    }
  }
end

