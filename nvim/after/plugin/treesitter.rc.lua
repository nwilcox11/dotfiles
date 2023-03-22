local has_ts, ts = pcall(require, 'nvim-treesitter.configs')
-- https://github.com/nvim-treesitter/nvim-treesitter

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
          "astro",
          "yaml"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
          disable = { "python" }
        },
    }
end
