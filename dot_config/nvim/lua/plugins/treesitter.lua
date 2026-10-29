return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'c', 'cpp', 'python', 'javascript', 'typescript', 'html', 'css', 'go', 'rust', 'dockerfile', 'lua', 'vim', 'vimdoc', 'json', 'yaml',
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
