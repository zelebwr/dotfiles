return {
    {
        'mfussenegger/nvim-lint',
        dependencies = {
            'mason-org/mason.nvim',
            'rshkarin/mason-nvim-lint',
        },
        config = function()
            local lint = require('lint')

            lint.linter_by_ft = {
                python = { 'ruff' },
                javascript = { 'eslint_d' },
                typescript = { 'eslint_d' },
                dockerfile = { 'hadolint' },
            }

            -- Automatically downloads and links missing linters specified in linters
            require('mason-nvim-lint').setup()
        end,
    },
}
