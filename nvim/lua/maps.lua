local opts = { silent = true }

vim.api.nvim_set_keymap("n", "<Leader>h", ":wincmd h<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>j", ":wincmd j<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>k", ":wincmd k<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>l", ":wincmd l<CR>", opts)
-- Undo Tree
vim.api.nvim_set_keymap("n", "<Leader>u", ":UndotreeToggle<CR>", opts)
-- Tab management
vim.api.nvim_set_keymap("n", "H", ":tabprevious<CR>", opts)
vim.api.nvim_set_keymap("n", "L", ":tabnext<CR>", opts)
vim.api.nvim_set_keymap("n", "tn", ":tabnew<CR>", opts)
vim.api.nvim_set_keymap("n", "ts", ":tab split<CR>", opts)

vim.api.nvim_set_keymap("i", "<C-c>", "<esc>", opts)
vim.api.nvim_set_keymap("n", "<C-c>", "<esc>", opts)

-- TODO: Map copen/cclose toggle.
vim.api.nvim_set_keymap("n", "<C-q>", "<Cmd> :copen<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<Cmd> :cnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<Cmd> :cprev<CR>", opts)

-- Hold on to what I have yanked after paste.
vim.api.nvim_set_keymap("v", "p", '"_dP"', opts)
