return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      require('mason').setup()

      -- 1. Pass blink.cmp LSP capabilities to all language servers (Neovim 0.11+)
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      -- 2. Attach LSP keymaps automatically whenever any server connects to a buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gr', function() require('fzf-lua').lsp_references() end, '[G]oto [R]eferences')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        end,
      })

      -- 3. Install servers (including Marksman for Markdown) and enable automatically
      require('mason-lspconfig').setup({
        ensure_installed = {
          'pyright',
          'clangd',
          'html',
          'cssls',
          'vtsls',
          'gopls',
          'rust_analyzer',
          'dockerls',
          'marksman',
        },
        automatic_enable = true,
      })
    end,
  },
}
