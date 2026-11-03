-------------------------------------------
-- Leader Key Setup
-------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleder = ' '

local keymap = vim.keymap.set
local opts = { silent = true }

-------------------------------------------
-- General Quality-of-Life Keymaps
-------------------------------------------
-- Clear search highlights with Esc
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

-- Keep cursor centered when scrolling half-pages
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-e>', '<C-e>zz', opts)

-- Keep search terms in the middle of the screen when jumping
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Join lines wihtout moving cursor to the end
keymap('n', 'J', 'mzJ`z', opts)

-- Open Floating Diagnostic Window
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-------------------------------------------
-- Visual Mode Improvements
-------------------------------------------
-- Move selected lines up or down in Visual mode
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '>-2<CR>gv=gv", opts)

-- Stay in Visual mode when indenting text
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Paste over highlighted text without losing original yanked text in register
keymap('x', '<leader>p', [["_dP]], { desc = 'Paste wihtout overwriting register' })

-- Substitute without saving to default register (blackhole register)
keymap('x', 's', [["_c]], { desc = 'Substitute without overwriting register' })

-------------------------------------------
-- System clipboard Integration
-------------------------------------------
-- Yank directly to system clipboard (<leader>y)
keymap({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipbard' })
keymap({'n', 'v'}, '<leader>Y', [["+Y]], { desc = 'Yank line to system clipboard' })

-- Delete without saving to default register (blackhole register)
keymap({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to blackhole register' })

------------------------------------------
-- Window Management & Navigation
------------------------------------------
-- Window Splitting
keymap('n', '<leader>sv', '<cmd>vsplit<CR>', { desc = 'Split window vertically' })
keymap('n', '<leader>sh', '<cmd>split<CR>', { desc = 'Split window horizontally' })
keymap('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Navigate between open Neovim Windows
keymap('n', '<leader>h', '<C-w>h', { desc = 'Move to left window' })
keymap('n', '<leader>j', '<C-w>j', { desc = 'Move to lower window' })
keymap('n', '<leader>k', '<C-w>k', { desc = 'Move to uppper window' })
keymap('n', '<leader>l', '<C-w>l', { desc = 'Move to right window' })

-- Resize split windows with arrows
keymap('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Resize split window to be taller' })
keymap('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Resize split window to be shorter' })
keymap('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Resize split window to be narrower' })
keymap('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Resize split window to be wider to ' })

------------------------------------------
-- Buffer Navigation
------------------------------------------
keymap('n', '[b', '<cmd>bprevious<CR>', { desc = 'Go to the previous buffer' })
keymap('n', ']b', '<cmd>bnext<CR>', { desc = 'Go to the next buffer' })
keymap('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete current buffer' })
