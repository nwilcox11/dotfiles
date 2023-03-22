local zen = require('zen-mode')

zen.setup {
  window = {
    width = 150,
    options = {
      number = true,
      relativenumber = true,
    }
  },
}

vim.keymap.set("n", "<leader>zz",
function()
    zen.toggle()
    vim.wo.wrap = false
end)
