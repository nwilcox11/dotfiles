-- vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {});
local opts = { silent = true }
vim.api.nvim_set_keymap("n", "<Leader>gs", ":Git <CR>", opts)
