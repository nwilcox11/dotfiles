require("nickwilcox.set")
require("nickwilcox.remap")
require("nickwilcox.packer")
require("nickwilcox.globals")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local nickwilcoxgroup = augroup('nickwilcox', {})

autocmd({"BufWritePre"}, {
    group = nickwilcoxgroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
