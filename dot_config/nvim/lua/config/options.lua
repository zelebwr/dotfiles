--------------------------------
-- Neovim Global Options
--------------------------------
local opt = vim.opt

local is_windows = vim.uv.os_uname().sysname == "Windows_NT"

if is_windows then
    vim.opt.shell = "powershell.exe"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned - Command"
else
    vim.opt.shell = "/bin/bash"
end

--------------------------------
-- 1. Line Numbers & Navigation
--------------------------------
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8           -- Keep 8 lines above/below cursor when scrolling
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

--------------------------------
-- 2. Indentation & Tabs
--------------------------------
opt.tabstop = 4 		    -- 1 tab = 4 spaces
opt.shiftwidth = 4		    -- Size of an indent
opt.expandtab = true 		-- Convert tabs to spaces
opt.smartindent = true		-- Insert indents automatically based on code structure

--------------------------------
-- 3. Search & Highlighting
--------------------------------
opt.ignorecase = true       -- Searches ignorecase
opt.smartcase = true        -- Searches case-sensitive when Capital Words are involved
opt.hlsearch = true         -- Highlight all search matches 
opt.incsearch = true        -- Show search matches as you type

--------------------------------
-- 4. UI & Visuals
--------------------------------
opt.termguicolors = true    -- Enable 24-bit RGB colors in terminal
opt.signcolumn = 'yes'      -- Always show sign column
opt.cursorline = true       -- Highlight the current line
opt.cursorcolumn = true     -- Highlight the current column
opt.showmode = false        -- Hdie mode indicator

--------------------------------
-- 5. Window Splitting Behavior
--------------------------------
opt.splitright = true       -- New vertical splits open to the right
opt.splitbelow = true       -- New horizontal splits open to the bottom

--------------------------------
-- 6. Performance & History Persistence
--------------------------------
opt.updatetime = 250        -- Faster Completion and diagnostic hover popup response
opt.timeoutlen = 300        -- Time to wait for mapped key sequences (in ms)
opt.undofile = true         -- Save undo history across Neovim restarts
opt.swapfile = false        -- Disable swap files in facor of git/undo history
