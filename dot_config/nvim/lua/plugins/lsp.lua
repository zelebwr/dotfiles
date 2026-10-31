return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mason-org/mason.nvim',
            'mason-org/mason-lspconfig.nvim',
        },
        config = function()
            require('mason').setup()
            local mason_lspconfig = require('mason-lspconfig')
            local lspconfig = require('lspconfig')

            mason_lspconfig.setup({
                ensure_installed = {
                    'pyright',
                    'clangd',
                    'html',
                    'cssls',
                    'vtsls',
                    'gopls',
                    'rust_analyzer',
                    'dockerls',
                },
                handlers = {
                    -- Default handler applied to all installed servers
                    function(server_name)
                        lspconfig[server_name].setup({
                            on_attach = function(_, bufnr)
                                local map = function(keys, func, desc)
                                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
                                end
                                map('gd', jim.lsp.buf.definition, '[G]oto [D]efinition')
                                map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
                                map('K', vim.lsp.buf.hover, 'Hover Documentation')
                                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                            end,
                        })
                    end,
                },
            })
        end,
    },
}
