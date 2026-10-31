return {
    -- Colorscheem: Catpuccin Macchiato
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = 'macchiato',
                transparent_background = true,
                custom_highlights = function(colors)
                    return {
                        CursorLineNr = { fg = colors.lavender, bold = true },
                        LineNr = { fg = colors.subtext1 },
                        LineNrAbove = { fg = colors.subtext1 },
                        LineNrBelow = { fg = colors.subtext1 },
                    }
                end,
            })
            vim.cmd.colorscheme('catppuccin-macchiato')
        end,
    },

    -- Statusline: lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
}
