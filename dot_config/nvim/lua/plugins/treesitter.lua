return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false, -- Load eagerly so fzf-lua and LSP previewers can access it
        opts = { 
            ensure_installed = {
                'c', 'cpp', 'python', 'javacript', 'typescript', 'html', 'css',
                'go', 'rust', 'dockerfile', 'lua', 'vim', 'vimdoc', 'json', 'yaml',
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function(_, opts)
            local status, configs = pcall(require, 'nvim-treesitter.configs')
            if not status then
                return
            end
            configs.setup(opts)
        end,
    },
}
