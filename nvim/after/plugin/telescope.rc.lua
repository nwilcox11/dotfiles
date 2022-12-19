local has_tscope, tscope = pcall(require, "telescope")
local actions = require'telescope.actions'

if has_tscope then
  tscope.setup {
    defaults = {
      file_ignore_patterns = {"%.git/", "node_modules/", "coverage/" },
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        }
      }
    },
  }
    local opts = { silent = true, noremap = true }
    local builtin = require('telescope.builtin');

    vim.api.nvim_set_keymap("n", "<Leader>ff", "<Cmd> Telescope find_files<CR>", opts)
    vim.api.nvim_set_keymap("n", "<C-p>", "<Cmd> Telescope git_files<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>fb", "<Cmd> Telescope buffers<CR>", opts)
    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)
    -- vim.api.nvim_set_keymap("n", "<Leader>fg", "<Cmd> Telescope live_grep<CR>", opts)
    -- vim.api.nvim_set_keymap("n", "<Leader>fs", "<Cmd> Telescope grep_string<CR>", opts)
    -- vim.api.nvim_set_keymap("n", "<Leader>gs", "<Cmd> Telescope git_status<CR>", opts)

end
