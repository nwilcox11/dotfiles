local has_trouble, trouble = pcall(require, "trouble")

if has_trouble then
  trouble.setup {}

local opts = { silent = true, noremap = true }

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
end
