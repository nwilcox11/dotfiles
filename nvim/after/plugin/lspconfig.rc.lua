local has_lsp, lsp = pcall(require, "lspconfig")
local cmp_nvim_lsp = require'cmp_nvim_lsp'
local null = require'null-ls'

if has_lsp then
  local on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local opts = { noremap = true, silent = true }
      buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
      buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
      -- Rename in buffer
      buf_set_keymap("n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
      -- Diagnostics
      buf_set_keymap("n", "<Leader>ds", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
      -- Format
      buf_set_keymap("n", "<Leader>p", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

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

  -- Custom server setups
  -- lsp.diagnosticls.setup {
  --     on_attach = on_attach,
  --     filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css' },
  --     init_options = {
  --       linters = {
  --         eslint = {
  --           command = 'eslint_d',
  --           rootPatterns = { '.git' },
  --           debounce = 200,
  --           args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
  --           sourceName = 'eslint_d',
  --           parseJson = {
  --             errorsRoot = '[0].messages',
  --             line = 'line',
  --             column = 'column',
  --             endLine = 'endLine',
  --             endColumn = 'endColumn',
  --             message = '[eslint] ${message} [${ruleId}]',
  --             security = 'severity'
  --          },
  --           securities = {
  --             [2] = 'error',
  --             [1] = 'warning'
  --           }
  --         },
  --       },
  --       filetypes = {
  --         javascript = 'eslint',
  --         javascriptreact = 'eslint',
  --         typescript = 'eslint',
  --         typescriptreact = 'eslint',
  --       },
  --       formatters = {
  --         eslint_d = {
  --           command = 'eslint_d',
  --           rootPatterns = { '.git' },
  --           args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
  --           rootPatterns = { '.git' },
  --         },
  --         prettier = {
  --           command = 'prettier_d_slim',
  --           rootPatterns = { '.git' },
  --           -- requiredFiles: { 'prettier.config.js' },
  --           args = { '--stdin', '--stdin-filepath', '%filename' }
  --         }
  --       },
  --       formatFiletypes = {
  --         css = 'prettier',
  --         javascript = 'prettier',
  --         javascriptreact = 'prettier',
  --         json = 'prettier',
  --         typescript = 'prettier',
  --         typescriptreact = 'prettier',
  --         json = 'prettier',
  --         markdown = 'prettier',
  --       }
  --     }
  --   }
    -- icon
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        -- This sets the spacing and the prefix, obviously.
        virtual_text = {
          spacing = 4,
          prefix = ''
        }
      }
    )
end

