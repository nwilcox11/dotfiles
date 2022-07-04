local has_cmp, cmp = pcall(require, "cmp")

vim.opt.completeopt = { "menu", "menuone", "noselect" }

if has_cmp then
    local lspkind = require"lspkind"
    lspkind.init()

    cmp.setup {
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["C-space"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm(),
        ["<c-n>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ["<c-p>"] = function(fallback)
          if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
      },
        snippet = {
          expand = function(args)
            require"luasnip".lsp_expand(args.body)
          end,
        },

        sources = {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "buffer" },
        },

        formatting = {
            format = lspkind.cmp_format({
                mode = "symbol_text",
                menu = ({
                    buffer = "[buf]",
                    nvim_lsp = "[LSP]",
                    path = "[path]"
                })
            })
        },

        experimental = {
            native_menu = false,
            ghost_text = false
        }
    }
end
