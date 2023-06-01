require("lualine").setup {
  options = {
    icons_enabled = false,
    component_separators = {
      left = "", right = ""
    },
    section_separators = {
      left = "", right = ""
    }
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
    },
    lualine_c = {
      {
        "filename",
        path = 1,
      },
    },
  },
}
