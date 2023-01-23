local tscope = require('telescope')
local builtin = require('telescope.builtin')

tscope.setup {
  pickers = {
    live_grep = {
      theme = "dropdown"
    },
  },
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
