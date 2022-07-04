local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<Leader>h", ":wincmd h<CR>", opts)
keymap("n", "<Leader>j", ":wincmd j<CR>", opts)
keymap("n", "<Leader>k", ":wincmd k<CR>", opts)
keymap("n", "<Leader>l", ":wincmd l<CR>", opts)

-- Tab management
keymap("n", "th", ":tabprevious<CR>", opts)
keymap("n", "tl", ":tabnext<CR>", opts)
keymap("n", "tn", ":tabnew<CR>", opts)
keymap("n", "ts", ":tab split<CR>", opts)

keymap("i", "<C-c>", "<esc>", opts)
keymap("n", "<C-c>", "<esc>", opts)

-- TODO: Map copen/cclose toggle.
keymap("n", "<C-q>", "<Cmd> :copen<CR>", opts)
keymap("n", "<C-k>", "<Cmd> :cnext<CR>", opts)
keymap("n", "<C-j>", "<Cmd> :cprev<CR>", opts)

-- Hold on to what I have yanked after paste
keymap("v", "p", '"_dP"', opts)
