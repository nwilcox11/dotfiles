local has_tscope, tscope = pcall(require, "telescope")
local actions = require'telescope.actions'

if has_tscope then
	tscope.setup {
		defaults = {
			prompt_prefix = "❯ ",
			selection_caret = "❯ ",
			layout_strategy = "flex",
			scroll_strategy = "cycle",
			color_devicons = true,
			file_ignore_patterns = {
				"node_modules",
				"package-lock.json",
				"sum",
			},
			dynamic_preview_title = true
		},
		pickers = {
			find_files = {
				theme = "ivy",
			},
			live_grep = {
				theme = "ivy",
			},
			grep_string = {
				theme = "ivy",
			},
			current_buffer_fuzzy_find = {
				theme = "ivy",
			},
			lsp_workspace_diagnostics = {
				theme = "ivy"
			},
			buffers = {
				theme = "ivy",
				sort_lastused = true,
				mappings = {
					i = {
						["<c-d>"] = actions.delete_buffer
					}
				}
			},
			git_files = {
				theme = "ivy"
			},
			file_browser = {
				theme = "ivy"
			},
			help_tags = {
				theme = "dropdown",
				previewer = false,
			}
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_file_sorter = true,
			},
			fzf_writer = {
				use_highlighter = false
			}
		}
	}

	tscope.load_extension("fzf")

	local opts = { silent = true, noremap = true }

	-- staged grep
	vim.api.nvim_set_keymap(
		"n",
		"<Leader>ga",
		":lua require('telescope').extensions.fzf_writer.staged_grep(require('telescope.themes').get_ivy())<CR>",
		opts
	)
	-- find files
	vim.api.nvim_set_keymap(
		"n",
		"<Leader>ff",
		":lua require('telescope').extensions.fzf_writer.files(require('telescope.themes').get_ivy())<CR>",
		opts
	)

	-- Seems to be a bug sending to quick fix list from here. (Only provides the directory of list item)
	vim.api.nvim_set_keymap("n", "<Leader>ds", "<Cmd> Telescope lsp_workspace_diagnostics<CR>", opts)

	vim.api.nvim_set_keymap("n", "<Leader>gs", "<Cmd> Telescope grep_string<CR>", opts)
	vim.api.nvim_set_keymap("n", "<Leader>bl", "<Cmd> Telescope buffers<CR>", opts)
	vim.api.nvim_set_keymap("n", "<Leader>bs", "<Cmd> Telescope current_buffer_fuzzy_find<CR>", opts)

	vim.api.nvim_set_keymap("n", "<Leader>pv", "<Cmd> Telescope file_browser<CR>", opts)

	vim.api.nvim_set_keymap("n", "<Leader>ht", "<Cmd> Telescope help_tags<CR>", opts)
end
