vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.shortmess:append "c"

local has_compe, compe = pcall(require, "compe")

if has_compe then
    compe.setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = 'enable',
        throttle_time = 200,
        source_timeout = 200,
        resolve_timeout = 800,
        incomplete_delay = 400,
        allow_prefix_unmatch = false,

        source = {
            path = true,
            buffer = true,
            calc = false,
            nvim_lsp = true,
            nvim_lua = true,
            spell = false,
            ultisnips = true,
            tags = true,
            luasnip = true,
            treesitter = false,
        },
    }

    local opts = { silent = true, noremap = true, expr = true }
    vim.api.nvim_set_keymap("i", "<c-y>", 'compe#confirm("<c-y>")', opts)
    vim.api.nvim_set_keymap("i", "<c-e>", 'compe#close("<c-e>")', opts)
    vim.api.nvim_set_keymap("i", "<c-space>", "compe#complete()", opts)
end


