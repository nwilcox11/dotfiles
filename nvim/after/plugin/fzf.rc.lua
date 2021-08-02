vim.g.fzf_nvim_statusline = 0

-- Anchor layout to bottom of screen.
vim.g.fzf_layout = {
    window = {
        width = 1,
        height = 0.6,
        relative = true,
        yoffset = 1.0
    },
}

vim.g.fzf_colors = {
	["fg"] = {"fg", "Normal" },
	["bg"] = {"bg", "Normal" },
	["hl"] = {"fg", "Normal" },
	["fg+"] = {"fg", "CursorLine", "CursorColumn", "Normal" },
	["bg+"] = {"bg", "CursorLine", "CursorColumn" },
	["hl+"] = {"fg", "Statement"},
	["info"] = {"fg", "PreProc" },
	["border"] = {"fg", "Ignore" },
	["prompt"] = {"fg", "Conditional" },
	["pointer"] = {"fg", "Exception" },
	["marker"] = {"fg", "Keyword" },
	["spinner"] = {"fg", "Label" },
	["header"] = {"fg", "Comment" }
}

--local opts = { silent = true }
--vim.api.nvim_set_keymap("n", "<Leader>ff", ":Files<CR>", opts)
--vim.api.nvim_set_keymap("n", "<Leader>fg", ":Rg<CR>", opts)
