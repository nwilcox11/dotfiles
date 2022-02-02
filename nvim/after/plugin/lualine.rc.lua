local has_lualine, lualine = pcall(require, "lualine")
has_lualine = false

if has_lualine then
    lualine.setup {
        options = {
            icons_enabled = true,
			section_separators = {'', ''},
			component_separators = {'', ''},
			theme = 'codedark',
            disabled_filetypes = {}
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { 'filename' },
            lualine_x = {
                { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
                'encoding',
                'filetype'
            },
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {}
    }
end

