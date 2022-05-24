local has_ts, ts = pcall(require, 'nvim-treesitter.configs')
-- https://github.com/nvim-treesitter/nvim-treesitter

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
      "css",
      "svelte",
      "graphql"
    },
    highlight = {
      enable = true,
      disable = { "typescript" }
    },
    indent = {
      enable = true,
      disable = { "css", "typescript", "python", "go" }
    },
   }
end
