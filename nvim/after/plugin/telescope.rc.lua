local tscope = require('telescope')
local builtin = require('telescope.builtin')

tscope.setup {
  pickers = {
    live_grep = {
      theme = "dropdown"
    },
    help_tags = {
      theme = "dropdown",
      previewer = false,
    },
  },
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
