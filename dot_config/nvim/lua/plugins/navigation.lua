return {
    -- Buffer-Based File Explorer: oil.nvim
    {
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            default_file_explorer = true,
            columns = { 'icon' },
            view_options = { show_hidden = true },
        },
        keys = {
            { '-', '<cmd>Oil<CR>', desc = 'Open parent directory in Oil' },
            {'<leader>pv', '<cmd>Oil<CR>', desc = 'Open file explorer' },
        },
    },

    -- Terminal-Style Fuzzy Finder: fzf-lua
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local fzf = require('fzf-lua')
            fzf.setup({ 'default-title' })

            vim.keymap.set('n', '<leader>ff', fzf.files, { desc = '(F)ind (F)iles' })
            vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = '(F)ind (G)rep (Live)' })
            vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = '(F)ind (B)uffer' })
            vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = '(F)ind (H)elp Tags' })
            vim.keymap.set('n', '<leader>fd', fzf.lsp_document_symbols, { desc = '(F)ind (D)ocuments Symbols' })
        end,
    },
}
