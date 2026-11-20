" ======================================================
" 1. Base Foundation, Options & Space Key Setup
" ======================================================
set clipboard=unnamed
set tabstop=4

" Release default Space motion to allow chord detection
unmap <Space>

" Clear search highlights with Esc
nmap <Esc> :nohl<CR>

" Keep cursor centered during scrolling and search navigation
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-e> <C-e>zz
nmap n nzzzv
nmap N Nzzzv
nmap j gjzz
nmap k gkzz
vmap j gjzz
vmap k gkzz

" Join lines without moving cursor to end of line
nnoremap J mzJ`z

" ======================================================
" 2. Clipboard & Register Operations
" ======================================================
" Yank directly to system clipboard
nmap <Space>y "+y
vmap <Space>y "+y
nmap <Space>Y "+Y
vmap <Space>Y "+Y

" Delete to blackhole register without overwriting yank buffer
nmap <Space>d "_d
vmap <Space>d "_d

" Paste/substitute over selection without overwriting yank buffer
vmap <Space>p "_dP
vnoremap s "_c

" ======================================================
" 3. Visual Mode Line Movements & Selection
" ======================================================
" Indent selection in Visual mode without losing focus
vnoremap < <gv
vnoremap > >gv

" Move selected lines down/up in Visual mode
exmap moveLineDown obcommand editor:swap-line-down
vnoremap J :moveLineDown<CR>gv

exmap moveLineUp obcommand editor:swap-line-up
vnoremap K :moveLineUp<CR>gv

" ======================================================
" 4. File Explorer, Fuzzy Finder & Command Palette
" ======================================================
" <Space>ff -> Quick Switcher (fzf-lua files equivalent)
exmap openSwitcher obcommand switcher:open
nmap <Space>ff :openSwitcher<CR>

" <Space>fg -> Global Search (fzf-lua live_grep equivalent)
exmap globalSearch obcommand omnisearch:show-modal
nmap <Space>fg :globalSearch<CR>

" <Space>pv and - -> File Explorer (oil.nvim equivalent)
exmap toggleExplorer obcommand file-explorer:open
nmap <Space>pv :toggleExplorer<CR>
nmap - :toggleExplorer<CR>

" <Space>fd -> Document Symbols / Outline
exmap openOutline obcommand outline:open
nmap <Space>fd :openOutline<CR>

" <Space>fh and <C-p> -> Command Palette (legendary.nvim / help tags)
exmap openPalette obcommand command-palette:open
nmap <Space>fh :openPalette<CR>
vmap <Space>fh :openPalette<CR>
nmap <C-p> :openPalette<CR>
vmap <C-p> :openPalette<CR>

" ======================================================
" 5. Window Splitting & Pane Navigation
" ======================================================
" Window Splitting (<Space>sv, <Space>sh, <Space>sx)
exmap splitVert obcommand workspace:split-vertical
nmap <Space>sv :splitVert<CR>

exmap splitHoriz obcommand workspace:split-horizontal
nmap <Space>sh :splitHoriz<CR>

exmap closeSplit obcommand workspace:close
nmap <Space>sx :closeSplit<CR>

" Pane Focus (Fixed editor:focus-bottom / focus-top IDs)
exmap focusLeft obcommand editor:focus-left
exmap focusBottom obcommand editor:focus-bottom
exmap focusTop obcommand editor:focus-top
exmap focusRight obcommand editor:focus-right

" Primary Neovim parity (<C-h/j/k/l>) + <Space> fallback
nmap <C-h> :focusLeft<CR>
nmap <C-j> :focusBottom<CR>
nmap <C-k> :focusTop<CR>
nmap <C-l> :focusRight<CR>

nmap <Space>h :focusLeft<CR>
nmap <Space>j :focusBottom<CR>
nmap <Space>k :focusTop<CR>
nmap <Space>l :focusRight<CR>

" ======================================================
" 6. Buffer/Tab Navigation & Obsidian Vault (<Space>o...)
" ======================================================
" Tab Navigation ([b / ]b)
exmap prevTab obcommand workspace:previous-tab
nmap [b :prevTab<CR>

exmap nextTab obcommand workspace:next-tab
nmap ]b :nextTab<CR>

" Close current tab/split (<Space>bd) & New tab (<Space>bt)
exmap closeTab obcommand workspace:close
nmap <Space>bd :closeTab<CR>

exmap newTab obcommand workspace:new-tab
nmap <Space>bt :newTab<CR>

" Make new note (<Space>bn) & Rename file title (<Space>rn)
exmap newFile obcommand file-explorer:new-file
nmap <Space>bn :newFile<CR>

exmap renameFile obcommand workspace:edit-file-title
nmap <Space>rn :renameFile<CR>

" Follow link under cursor (gd)
exmap followLink obcommand editor:follow-link
nmap gd :followLink<CR>

" Obsidian Vault Navigation Namespace (<Space>o... parity with obsidian.nvim)
exmap openBacklinks obcommand backlink:open
exmap openTags obcommand tag-pane:open

nmap <Space>of :openSwitcher<CR>
nmap <Space>ob :openBacklinks<CR>
nmap <Space>ot :openTags<CR>
nmap <Space>on :newFile<CR>
nmap <Space>os :globalSearch<CR>

" ======================================================
" 7. Markdown Formatting, Previews, Tables & Folding
" ======================================================
" Toggle task checkbox (<Space>x)
exmap toggleChecklist obcommand editor:toggle-checklist-status
nmap <Space>x :toggleChecklist<CR>
vmap <Space>x :toggleChecklist<CR>

" Bold (<Space>mb)
exmap toggleBold obcommand editor:toggle-bold
exmap surroundBold surround ** **
nmap <Space>mb :toggleBold<CR>
vmap <Space>mb :surroundBold<CR>gv

" Italic (<Space>mi)
exmap toggleItalic obcommand editor:toggle-italics
exmap surroundItalic surround * *
nmap <Space>mi :toggleItalic<CR>
vmap <Space>mi :surroundItalic<CR>gv

" Highlight (<Space>mh)
exmap toggleHighlight obcommand editor:toggle-highlight
exmap surroundHighlight surround == ==
nmap <Space>mh :toggleHighlight<CR>
vmap <Space>mh :surroundHighlight<CR>gv

" Inline Code (<Space>mc)
exmap toggleCode obcommand editor:toggle-code
exmap surroundCode surround ` `
nmap <Space>mc :toggleCode<CR>
vmap <Space>mc :surroundCode<CR>gv

" Insert Markdown Link (<Space>mk) & Wikilink (<Space>mw)
exmap insertLink obcommand editor:insert-link
nmap <Space>mk :insertLink<CR>
vmap <Space>mk :insertLink<CR>

exmap insertWikilink obcommand editor:insert-wikilink
exmap surroundWikilink surround [[ ]]
nmap <Space>mw :insertWikilink<CR>
vmap <Space>mw :surroundWikilink<CR>gv

" Insert Callout (<Space>mC)
exmap insertCallout obcommand editor:insert-callout
nmap <Space>mC :insertCallout<CR>
vmap <Space>mC :insertCallout<CR>

" Table of Contents / Outline (<Space>mt), Preview (<Space>mp), Table (<Space>tm)
exmap togglePreview obcommand markdown:toggle-preview
exmap insertTable obcommand editor:insert-table

nmap <Space>mt :openOutline<CR>
nmap <Space>mp :togglePreview<CR>
nmap <Space>tm :insertTable<CR>

" Blockquotes (<Space>mq / <Space>mQ)
exmap toggleBlockquote obcommand editor:toggle-blockquote
nmap <Space>mq :toggleBlockquote<CR>
vmap <Space>mq :s/^/><Space>/<CR>
vmap <Space>mQ :s/^><Space>//<CR>

" Heading & List Folding (za, zM, zR)
exmap toggleFold obcommand editor:toggle-fold
exmap foldAll obcommand editor:fold-all
exmap unfoldAll obcommand editor:unfold-all

nmap za :toggleFold<CR>
nmap zM :foldAll<CR>
nmap zR :unfoldAll<CR>

" ======================================================
" 8. Text Case Transformations (Obsidian Text Format)
" ======================================================
exmap textLowercase obcommand obsidian-text-format:lowercase
nmap <Space>cl :textLowercase<CR>
vmap <Space>cl :textLowercase<CR>gv

exmap textUppercase obcommand obsidian-text-format:uppercase
nmap <Space>cu :textUppercase<CR>
vmap <Space>cu :textUppercase<CR>gv

exmap textTitlecase obcommand obsidian-text-format:title-case
nmap <Space>ct :textTitlecase<CR>
vmap <Space>ct :textTitlecase<CR>gv

exmap textCyclecase obcommand obsidian-text-format:cycle-case
nmap <Space>cc :textCyclecase<CR>
vmap <Space>cc :textCyclecase<CR>gv
