local has_lsp, lsp = pcall(require, "lspconfig")
local cmp_nvim_lsp = require'cmp_nvim_lsp'
local null = require'null-ls'

if has_lsp then
  local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local opts = { noremap = true, silent = true }
      buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
      buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
      buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      -- Rename in buffer
      buf_set_keymap("n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
      -- Diagnostics
      buf_set_keymap("n", "<Leader>ds", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
      -- Format
      buf_set_keymap("n", "<Leader>p", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    if client.name == "tsserver" then
      client.resolved_capabililties.document_formatting = false
    end
  end

  local diagnostic_signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
  }
  for _, sign in ipairs(diagnostic_signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local diagnostic_config = {
    virtual_text = {
      spacing = 2,
      prefix = ''
    },
    signs = {
      active = diagnostic_signs,
    },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
      focusable = false,
      -- style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    }
}

  vim.diagnostic.config(diagnostic_config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    focusable = false,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

  -- Enable the following Lsp's
  local servers = { "clangd", "pyright", "tsserver", "svelte", "gopls", "graphql" }

  for _, s in ipairs(servers) do
    lsp[s].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end

  require'lspconfig'.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
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

  local formatting_file_types = { "json", "javascript", "javascriptreact", "typescript", "typescriptreact" }
  local linting_file_types = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

  null.setup({
    sources = {
      null.builtins.diagnostics.eslint_d.with({
        filetypes = linting_file_types,
        diagnostics_format = "[#{s}] #{m} [#{c}]"
      }),
      null.builtins.code_actions.eslint_d,
      null.builtins.formatting.prettier.with({
       filetypes = formatting_file_types
      })
    },
    on_attach = on_attach
  })
end

