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

		-- Using telescope with quickfix list to read diagnostics for now...
		--
		-- buf_set_keymap("n", "di", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
		-- buf_set_keymap("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
		-- buf_set_keymap("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

        -- format on save.
        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
            vim.api.nvim_command [[augroup END]]
        end
    end

    lsp.tsserver.setup {
        on_attach = function (client, bufnr)
            -- TODO: watch for formatting issues.
            -- client.resolved_capabilities.document_formatting = false
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
		filetypes = {
		  "typescript",
		  "typescriptreact",
		  "typescript.tsx",
		  "javascript",
		  "javascriptreact",
		  "css",
		  "html",
		  "markdown"
		},
		init_options = {
			formatters = {
				prettier = {
					command = "prettier",
					args = { "--stdin-filepath", "%filename" },
				},
			},
			formatFiletypes = {
				typescript = "prettier",
				typescriptreact = "prettier",
				javascript = "prettier",
				javascriptreact = "prettier",
			}
		},
    }

	lsp.clangd.setup { on_attach = on_attach }
	lsp.gopls.setup { on_attach = on_attach }
	lsp.pyright.setup { on_attach = on_attach }
end

