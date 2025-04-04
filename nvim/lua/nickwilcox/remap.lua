-- Move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- Keeps cursor in the middle of screen while half page jumping.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Keeps search terms in the middle of screen.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

local opts = { silent = true }

-- Tab Managment
vim.keymap.set("n", "H", ":tabprevious<CR>", opts)
vim.keymap.set("n", "L", ":tabnext<CR>", opts)
vim.keymap.set("n", "tn", ":tabnew<CR>", opts)
vim.keymap.set("n", "ts", ":tab split<CR>", opts)

-- Split managment
vim.keymap.set("n", "<Leader>h", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<Leader>j", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<Leader>k", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<Leader>l", ":wincmd l<CR>", opts)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set({ "i", "n" }, "<C-c>", "<Esc>", opts);
vim.keymap.set("n", "Q", "<nop>");

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts);
