local tr = require("trouble")

vim.keymap.set("n", "<leader>xx", function()
  tr.toggle("diagnostics")
end, {})
