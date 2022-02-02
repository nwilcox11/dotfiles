local has_lsp, lsp = pcall(require, "lspconfig")

if has_lsp then
    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        local opts = { noremap=true, silent=true }

        buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
        buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

        -- format on save.
        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
            vim.api.nvim_command [[augroup END]]
        end
    end

-- Set up LSPs
    lsp.tsserver.setup {
        on_attach = function (client, bufnr)
            client.resolved_capabilities.document_formatting = false
            on_attach(client, bufnr)
        end,
        filetypes = {
           "typescript",
           "typescriptreact",
           "typescript.tsx",
           "javascript",
           "javascriptreact"
        }
    }

    lsp.diagnosticls.setup {
      on_attach = on_attach,
      filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less' },
      init_options = {
        linters = {
          eslint = {
            command = 'eslint_d',
            rootPatterns = { '.git' },
            debounce = 100,
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
          scss = 'prettier',
          less = 'prettier',
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
        underline = true,
        -- This sets the spacing and the prefix, obviously.
        virtual_text = {
          spacing = 4,
          prefix = ''
        }
      }
    )

	lsp.clangd.setup { on_attach = on_attach }
	lsp.gopls.setup { on_attach = on_attach }
	lsp.pyright.setup { on_attach = on_attach }
end

