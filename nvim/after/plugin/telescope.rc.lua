local has_tscope, tscope = pcall(require, "telescope")
local actions = require'telescope.actions'

if has_tscope then
  tscope.setup {
    defaults = {
      file_ignore_patterns = {"%.git/", "node_modules/", "coverage/" },
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        }
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
      -- find_files = {
      --   theme = "ivy",
      --   layout_config = { height = 0.65, preview_width = 0.60 },
      -- },

      -- live_grep = {
      --  theme = "ivy",
      --  layout_config = { height = 0.65, preview_width = 0.60 },
      -- },

      -- grep_string = {
      --   theme = "ivy",
      --   layout_config = { height = 0.65, preview_width = 0.60 },
      -- },

      -- buffers = {
      --   theme = "ivy",
      --   layout_config = { height = 0.65, preview_width = 0.60 },
      -- }
    },
  }
    local opts = { silent = true, noremap = true }
    vim.api.nvim_set_keymap("n", "<Leader>ff", "<Cmd> Telescope find_files<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>fg", "<Cmd> Telescope live_grep<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>fs", "<Cmd> Telescope grep_string<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>gs", "<Cmd> Telescope git_status<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>fb", "<Cmd> Telescope buffers<CR>", opts)
end
