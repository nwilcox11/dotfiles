require("lualine").setup {
  options = {
    icons_enabled = false,
  },
  sections = {
    lualine_b = {
      {
        'diagnostics',

        symbols = {
          error = '● ',
          warn = '● ',
          info = '● ',
          hint = '● ',
        }
      }
    }
  },
}
