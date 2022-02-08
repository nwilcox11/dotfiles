local has_tree, tree = pcall(require, "nvim-tree")

if has_tree then
    tree.setup {}

    local opts = { silent = true, noremap = true }
    vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd> :NvimTreeToggle<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>r", "<Cmd> :NvimTreeRefresh<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Leader>n", "<Cmd> :NvimTreeFindFile<CR>", opts)
end
