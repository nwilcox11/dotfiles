local tscope = require('telescope')
local builtin = require('telescope.builtin')
local telescopeConfig = require('telescope.config')

-- Clone the default Telescope config
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")

tscope.setup {
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    live_grep = {
      theme = "dropdown"
    },
    help_tags = {
      theme = "dropdown",
      previewer = false,
    },
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    buffers = {
      theme = "dropdown"
    }
  },
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
