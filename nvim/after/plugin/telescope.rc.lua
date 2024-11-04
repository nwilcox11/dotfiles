local tscope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

tscope.setup {
  pickers = {
    live_grep = {
      theme = "dropdown"
    },
    help_tags = {
      theme = "dropdown",
      previewer = false,
    },
    buffers = {
      theme = "dropdown",
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
        n = {
          ["<c-d>"] = actions.delete_buffer,
        }
      }
    }
  },
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
