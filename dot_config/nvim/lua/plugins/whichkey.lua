return {
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            preset = 'classic',
            win = {
                border = 'rounded',
            },
        },
        keys = {
            { 
                '<leader>?',
                function()
                    require('which-key').show({ global = false })
                end,
                desc = 'Buffer Keymaps (WhichKey)',
            },
        },
    },
}
