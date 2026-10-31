---------------------------------
---Neovim Autocommands
---------------------------------
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

---------------------------------
---1. Highlight Text on Yank`
---------------------------------
-- Briefly highlight text when yankign to give visual feedback
autocmd('TextYankPost', {
    group = augroup('HighlightYank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 150, 
        })
    end,
})

---------------------------------
---2. Asynchronous Linting Trigger (nvim-lint)
---------------------------------
-- Run nvim-lint asynchronously when opening buffers, saving, or leving insert mode
autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = augroup('NvimLintTrigger', { clear = true }),
    callback = function()
        local ok, lint = pcall(require, 'lint')
        if ok then
            lint.try_lint()
        end
    end,
})

---------------------------------
---3. Restore Last Cursor Position on File Open
---------------------------------
-- Re-open files at the exact line / column position you were last editing
autocmd('BufReadPost', {
    group = augroup('RestoreCursor', { clear = true }),
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0 , mark)
        end
    end,
})

---------------------------------
---4. Close  Utilitiy & Help Buffers with 'q'
---------------------------------
-- Quickly close help, qf, man, and diagnostic windows using just <q>
autocmd('FileType', {
    group = augroup('QuickCloseBuffers', { clear = true }),
    pattern = {
        'help',
        'lspinfo',
        'man',
        'notify',
        'qf',
        'query',
        'checkhealth',
        'oil',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<CR>', {
            buffer = event.buf,
            silent = true,
            desc = 'Close Buffer',
        })
    end,
})

---------------------------------
---5. Auto-Create Missing Parent Directories on Save
---------------------------------
-- Automatically create non-existent directories when saving a new file
autocmd('BufWritePre', {
    group = augroup('AutoCreateDirs', { clear = true }),
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})

---------------------------------
---6. Auto-Resize Splits on Terminal Window Resize
---------------------------------
-- Balance split pane dimensions automatically whn resizing the host window
autocmd('VimResized', {
    group = augroup('ResizeSplits', { clear = true }),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd('tabdo wincmd =')
        vim.cmd('tabnext ' .. current_tab)
    end,
})

---------------------------------
---7. Reload Changed Files Automatically
---------------------------------
-- Check if files were updated externally (e.g., vim git or external script)
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = augroup('CheckExternalEdites', { clear = true }),
    callback = function()
        if vim.o.buftype ~= 'nofile' then
            vim.cmd('checktime')
        end
    end,
})

---------------------------------
---8. Export All  Custom Keymaps with Descriptons to KEYMAPS.md
---------------------------------
vim.api.nvim_create_user_command('ExportKeymaps', function()
    local modes = { 'n', 'v', 'x', 'i' }
    local mode_names = { n = 'Normal Mode', v = 'Visual Mode', x = 'Visual Only', i = 'Insert Mode' }
    local lines = { '# Neovim Keymaps Cheat Sheet', '', 'Auto-generated keymap document.', '' }

    for _, mode in ipairs(modes) do
        local maps = vim.keymap.get(mode)
        local mode_lines = {}

        for _, map in ipairs(maps) do
            -- Only document custom mappings tha thave a description string
            if map.desc and map.desc ~= '' then
                local lhs = map.lhs:gsub(' ', '<Space>')
                local rhs = type(map.rhs) == 'string' and map.rhs or '[Lua Function]'
                table.insert(mode_lines, string.format('| `%s` | %s | `%s` |', lhs, map.desc, rhs))
            end
        end

        if #mode_lines > 0 then
            table.insert(lines, '## ' .. mode_names[mode])
            table.insert(lines, '')
            table.insert(lines, '| Keybinding | Description | Action |')
            table.insert(lines, '| :--- | :--- | :--- |')
            for _, line in ipairs(mode_lines) do
                table.insert(lines, line)
            end
            table.insert(lines, '')
        end
    end

    local output_path = vim.fn.stdpath('config') .. '/KEYMAPS.md'
    vim.fn.writefile(lines, output_path)
    vim.notify('Exported keymaps to ' .. output_path, vim.log.levels.INFO)
end, { desc = 'Export keymaps to KEYMAPS.md' })
