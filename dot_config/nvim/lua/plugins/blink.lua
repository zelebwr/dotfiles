return {
  {
    'saghen/blink.cmp',
    version = '1.*', -- Downloads prebuilt Rust fuzzy-matcher binary (works on Fedora & Windows 11)
    event = 'InsertEnter',
    opts = {
      keymap = {
        preset = 'default',

        -- Disable <C-Space> so WezTerm's Ctrl+Space leader key intercepts it cleanly
        ['<C-Space>'] = false,
        ['<M-Space>'] = false,

        -- Conflict-free triggers to manually open menu / toggle documentation
        ['<C-j>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-\\>'] = { 'show', 'show_documentation', 'hide_documentation' },

        -- Menu navigation & confirmation
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-e>'] = { 'hide', 'fallback' },
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        list = {
          selection = {
            -- Prevents Enter (<CR>) from accidentally accepting a popup item while typing prose
            preselect = false,
            auto_insert = false,
          },
        },
      },

      -- 'lsp' automatically picks up Marksman and obsidian-nvim's in-process LSP
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },
    },
  },
}
