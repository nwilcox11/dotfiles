local has_ts, ts = pcall(require, 'nvim-treesitter.configs')
-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- Turning off treesitter for now.
has_ts = false

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
    highlight = {
      enable = false,
      disable = { "typescript" }
    },
    indent = {
      enable = true,
      disable = { "typescript", "python" }
    },
   }
end
