return {
    -- Colorscheem: Catpuccin Macchiato
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('catppuccin-macchiato')
        end,
    },

    -- Statusline: lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'catppuccin',
                componeent_separators = '|',
                section_separators = '',
            },
        },
    },
}
