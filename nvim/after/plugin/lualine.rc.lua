local has_lualine, lualine = pcall(require, "lualine")

if has_lualine then
    lualine.setup {
        options = {
            component_separators = '|',
            section_separators = '',
            theme = 'auto',
        },
        sections = {
          lualine_c = { { 'filename', path = 1} }
        }
    }
end

