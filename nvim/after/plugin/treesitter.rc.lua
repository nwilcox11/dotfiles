local has_ts, ts = pcall(require, 'nvim-treesitter.configs')

if has_ts then
    ts.setup {
        ensure_installed = {
            "typescript",
            "tsx",
            "go",
            "rust",
            "python",
            "c",
            "toml",
            "fish",
            "json",
            "html",
            "css"
        },

        highlight = {
            enable = false,
            disable = {"json"},
        },

        indent = {
            enable = false,
            disable = {}
        },
    }
end
