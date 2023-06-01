local trouble = require("trouble")

trouble.setup({
  icons = false,
  signs = {
    error = '● ',
    warn = '● ',
    info = '● ',
    hint = '● ',
  },
})

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true })
