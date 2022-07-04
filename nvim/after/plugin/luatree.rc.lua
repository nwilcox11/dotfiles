local has_tree, tree = pcall(require, "nvim-tree")

if has_tree then
  tree.setup {
    view = {
      width = 35
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    }
  }

    local opts = { silent = true, noremap = true }
    vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd> :NvimTreeToggle<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>r", "<Cmd> :NvimTreeRefresh<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>n", "<Cmd> :NvimTreeFindFile<CR>", opts)
end
