local has_ts, ts = pcall(require, 'nvim-treesitter.configs')

if has_ts then
    ts.setup {
        ensure_installed = {
            "typescript",
			"javascript",
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
            "css",
        },
        highlight = {
            enable = true,
            disable = { "lua" }
        },

    }
end
