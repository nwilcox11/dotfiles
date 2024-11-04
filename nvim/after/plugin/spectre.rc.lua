require("spectre").setup {}

vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set("v", "<leader>sw", '<cmd>lua require("spectre").open_visual({ select_word= true})<CR>',
  { desc = "Search Current Word" })
