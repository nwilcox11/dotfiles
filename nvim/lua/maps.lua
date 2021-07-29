local opts = { silent = true }
vim.api.nvim_set_keymap("n", "<Leader>h", ":wincmd h<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>j", ":wincmd j<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>k", ":wincmd k<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>l", ":wincmd l<CR>", opts)

vim.api.nvim_set_keymap("i", "<C-c>", "<esc>", opts)
vim.api.nvim_set_keymap("n", "<C-c>", "<esc>", opts)

-- Open file tree.
vim.api.nvim_set_keymap("n", "<Leader>pv", ":wincmd v<bar>:Ex<bar> :vertical resize 30<CR>", opts)
