local tr = require("trouble")
tr.setup {
  icons = false,
  use_diagnostic_signs = true,
}

vim.keymap.set("n", "<leader>xx", tr.toggle)
vim.keymap.set("n", "<leader>xq", function() tr.toggle("quickfix") end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
