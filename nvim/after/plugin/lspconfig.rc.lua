local has_lsp, lsp = pcall(require, "lspconfig")
local cmp_nvim_lsp = require'cmp_nvim_lsp'

if has_lsp then
  local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local opts = { noremap = true, silent = true }
      buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
      buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
      -- Rename in buffer
      buf_set_keymap("n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
      -- Diagnostics
      buf_set_keymap("n", "<Lader>ds", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
      -- Format
      buf_set_keymap("n", "<Leader>p", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

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

  -- Custom server setups
  lsp.diagnosticls.setup {
      on_attach = on_attach,
      filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css' },
      init_options = {
        linters = {
          eslint = {
            command = 'eslint_d',
            rootPatterns = { '.git' },
            debounce = 200,
            args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
            sourceName = 'eslint_d',
            parseJson = {
              errorsRoot = '[0].messages',
              line = 'line',
              column = 'column',
              endLine = 'endLine',
              endColumn = 'endColumn',
              message = '[eslint] ${message} [${ruleId}]',
              security = 'severity'
           },
            securities = {
              [2] = 'error',
              [1] = 'warning'
            }
          },
        },
        filetypes = {
          javascript = 'eslint',
          javascriptreact = 'eslint',
          typescript = 'eslint',
          typescriptreact = 'eslint',
        },
        formatters = {
          eslint_d = {
            command = 'eslint_d',
            rootPatterns = { '.git' },
            args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
            rootPatterns = { '.git' },
          },
          prettier = {
            command = 'prettier_d_slim',
            rootPatterns = { '.git' },
            -- requiredFiles: { 'prettier.config.js' },
            args = { '--stdin', '--stdin-filepath', '%filename' }
          }
        },
        formatFiletypes = {
          css = 'prettier',
          javascript = 'prettier',
          javascriptreact = 'prettier',
          json = 'prettier',
          typescript = 'prettier',
          typescriptreact = 'prettier',
          json = 'prettier',
          markdown = 'prettier',
        }
      }
    }
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
