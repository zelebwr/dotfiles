-------------------------------------------
---Bootstrap lazy.nvim Plugin Manager
-------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-------------------------------------------
---Configure lazy.nvim & Import All Plugins in lua/plugins/*.lua
-------------------------------------------
require('lazy').setup({
    spec = {
        -- Automatically loads every plugin file inside lua/plugins/
        { import = 'plugins' },
    },
    defaults = {
        lazy = false,
    },
    checker = { 
        enabled = true,         -- Automatically check for plugin updates
        notify = false,         -- Prevent popup notifications on startup when updates are found
    },
    ui = {
        border = 'rounded',
    },
    performance = {
        rtp = {
            -- Disable unpeeded built-in Vim plugins for faster startup times
            disabled_plugins = {
                'netrw',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})  
