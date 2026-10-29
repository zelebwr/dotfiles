return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                python = { 'ruff_format', 'black' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                html = { 'prettier' },
                css = { 'prettier' },
                c = { 'clang-format' },
                cpp = { 'clang-format' },
                go = { 'gofmt' },
                rust = { 'rustfmt' },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
}
