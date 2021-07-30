local has_tscope, tscope = pcall(require, 'telescope')

if has_tscope then
    local actions = require'telescope.actions'

    tscope.setup {
        defaults = {
            prompt_prefix = "❯ ",
            selection_caret = "❯ ",
            mappings = {
                n = {
                    ["q"] = actions.close
                },
            },
            layout_strategy = "horizontal",
            layout_config = {
                width = 0.95,
                height = 0.85,
                prompt_position = "top",
                horizontal = {
                    preview_width = function(_, cols, _)
                       if cols > 200 then
                           return math.floor(cols * 0.4)
                       else
                           return math.floor(cols * 0.6)
                       end
                    end,
                },
                vertical = {
                    width = 0.9,
                    height = 0.95,
                    preview_height = 0.5
                },
                flex = {
                    horizontal = {
                        preview_width = 0.9
                    }
                },
            },
        }
    }

    local opts = { silent = true, noremap = true }
    vim.api.nvim_set_keymap("n", "ff", "<Cmd>Telescope find_files<CR>", opts)
    vim.api.nvim_set_keymap("n", "fg", "<Cmd>Telescope live_grep<CR>", opts)
    vim.api.nvim_set_keymap("n", "fb", "<Cmd>Telescope buffers<CR>", opts)
    vim.api.nvim_set_keymap("n", "fh", "<Cmd>Telescope help_tags<CR>", opts)
end
