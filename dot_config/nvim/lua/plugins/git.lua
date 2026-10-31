return {
    -- 1. Visual Git signs in the signcolumn, hunk previewing, & inline
    {      'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            sign = {
                add             = { text = '+'},
                change          = { text = '~'},
                delete          = { text = '_'},
                topdelete       = { text = '‾'},
                changedelete    = { text = '+'},
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation through Git changes (Hunks)
                map('n', ']h', function()
                    if vim.wo.diff then return ']h' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, desc = 'Next git Hunk' })

                map('n', '[h', function()
                    if vim.wo.diff then return '[h' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, desc = 'Previous Git Hunk' })

                -- Actions
                map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage Git Hunk' })
                map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset Git Hunk' })
                map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = 'Stage Selected Lines' })
                map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Git Hunk' })
                map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, { desc = 'Git Blame Line' })
                map('n', '<leader>hd', gs.diffthis, { desc = 'Git  Diff Against Index' })
            end,
        },
    },

    -- 2. Full Git Wrapper (Commit, Push, Stage, Blame interface)
    {
        'tpope/vim-fugitive',
        cmd = { 'Git', 'G', 'Gdiffsplit', 'Gvdiffsplit', 'Gwrite' },
        keys = {
            { '<leader>gs', '<cmd>Git<cr>', desc = 'Open Git Status Window' },
            { '<leader>gp', '<cmd>Git push<cr>', desc = 'Git Push' },
            { '<leader>gl', '<cmd>Git pull<cr>', desc = 'Git Pull' },
        },
    },
}
