local opts = { silent = true }
vim.api.nvim_set_keymap("n", "<Leader>gs", ":Git <CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>gl", ":Gclog <CR>", opts)
