require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "<leader>pv", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
