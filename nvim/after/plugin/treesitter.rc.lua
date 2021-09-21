local has_ts, ts = pcall(require, 'nvim-treesitter.configs')

if has_ts then
    ts.setup {
        ensure_installed = {
            "typescript",
            "tsx",
            "go",
			"lua",
            "rust",
            "python",
            "c",
            "toml",
            "fish",
            "json",
            "html",
            "css"
        },
	additional_vim_regex_highlighting = false,
        highlight = {
            enable = true,
            disable = {},
        },

        indent = {
            enable = true,
            disable = { "typescript", "python" }
        },
    }
end
