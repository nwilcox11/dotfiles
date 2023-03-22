local has_tree, tree = pcall(require, "nvim-tree")

has_tree = false

if has_tree then
    tree.setup {
        view = {
            width = 35
        },
      diagnostics = {
      enable = true,
      show_on_dirs = true,
    }
    }

    local opts = { silent = true, noremap = true }
    -- vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd> :NvimTreeToggle<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>pv", "<Cmd> :NvimTreeToggle<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>r", "<Cmd> :NvimTreeRefresh<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>n", "<Cmd> :NvimTreeFindFile<CR>", opts)
end
