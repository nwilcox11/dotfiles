local has_tscope, tscope = pcall(require, "telescope")
local actions = require'telescope.actions'

if has_tscope then
  tscope.setup {
    defaults = {
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
      find_files = {
        theme = "ivy"
      },

      live_grep = {
       theme = "ivy"
      },

      grep_string = {
        theme = "ivy"
      },

      buffers = {
        theme = "ivy"
      }
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }

	-- staged grep
    local opts = { silent = true, noremap = true }
    -- FILE PICKERS --
    -- List files in cwd
    vim.api.nvim_set_keymap("n", "<Leader>ff", "<Cmd> Telescope find_files<CR>", opts)
    -- File Tree
	vim.api.nvim_set_keymap("n", "<Leader>pv", "<Cmd> Telescope file_browser<CR>", opts)
    -- Search for string in cwd
    vim.api.nvim_set_keymap("n", "<Leader>fg", "<Cmd> Telescope live_grep<CR>", opts)
    -- Search for string under cursor in cwd
    vim.api.nvim_set_keymap("n", "<Leader>fs", "<Cmd> Telescope grep_string<CR>", opts)
    -- VIM PICKERS --
    -- Lists open buffers in current neovim instance
    vim.api.nvim_set_keymap("n", "<Leader>fb", "<Cmd> Telescope buffers<CR>", opts)
end
