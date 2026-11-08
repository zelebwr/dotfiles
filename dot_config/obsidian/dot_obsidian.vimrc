" ======================================================
" 1. Base Foundation & Space Key Setup
" ======================================================
set clipboard=unnamed

" Releases default Space motion to allow chord detection
unmap <Space>

" Clear search highlights with Esc
nmap <Esc> :nohl<CR>

" Keep cursor centered during scrolling and search navigation
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nmap n nzzzv
nmap N Nzzzv
nmap j gjzz
nmap k gkzz
vmap j gjzz
vmap k gkzz

" ======================================================
" 2. Clipboard & Register Operations
" ======================================================
" Yank directly to system clipboard
nmap <Space>y "+y
vmap <Space>y "+y
nmap <Space>Y "+Y
vmap <Space>Y "+Y

" Delete to blackhole register without overwriting yank buffer (<Space>d)
nmap <Space>d "_d
vmap <Space>d "_d

" Paste over selection without overwriting yank buffer (<Space>p)
vmap <Space>p "_dP

" ======================================================
" 3. Visual Mode Line Movements & Selection
" ======================================================
" Indenct selection in Visual mode without losing focus
vnoremap < <gv
vnoremap > >gv

" Move selected lines down in Visual mode
exmap moveLineDown obcommand editor:swap-line-down
vnoremap J :moveLineDown<CR>gv

" Move selected lines up in Visual mode
exmap moveLineUp obcommand editor:swap-line-up
vnoremap K :moveLineUp<CR>gv

" ======================================================
" 4. File Explorer & Fuzzy Finder
" ======================================================
" <Space>ff -> Quick Switcher (fzf.files equivalent)
exmap openSwitcher obcommand switcher:open
nmap <Space>ff :openSwitcher<CR>

" <Space>fg -> Global Search (fzf.live_grep equivalent)
exmap globalSearch obcommand omnisearch:show-modal
nmap <Space>fg :globalSearch<CR>

" <Space>pv and - -> File Explorer (oil.nvim equivalent)
exmap toggleExplorer obcommand file-explorer:open
nmap <Space>pv :toggleExplorer<CR>
nmap - :toggleExplorer<CR>

" <Space>fd -> Document Symbols / Outline
exmap openOutline obcommand outline:open
nmap <Space>fd :openOutline<CR>

" <Space>fh -> Command Palette / Help Tags
exmap openPalette obcommand command-palette:open
nmap <Space>fh :openPalette<CR>
vmap <Space>fh :openPalette<CR>

" ======================================================
" 5. Window Splitting & Pane Navigation
" ======================================================
"Window Splitting (<Space>sv, <Space>sh, <Space>sx)
exmap splitVert obcommand workspace:split-vertical
nmap <Space>sv :splitVert<CR>

exmap splitHoriz obcommand workspace:split-horizontal
nmap <Space>sh :splitHoriz<CR>

exmap closeSplit obcommand workspace:close
nmap <Space>sx :closeSplit<CR>

" Navigate open splits with Ctrl + h/j/k/l
exmap focusLeft obcommand editor:focus-left
nmap <Space>h :focusLeft<CR>

exmap focusLower obcommand editor:focus-lower
nmap <Space>j :focusLower<CR>

exmap focusUpper obcommand editor:focus-upper
nmap <Space>k :focusUpper<CR>

exmap focusRight obcommand editor:focus-right
nmap <Space>l :focusRight<CR>

" ======================================================
" 6. Buffer/Tab Navigation & Task Management
" ======================================================
" Tab Navigation ([b / ]b)
exmap prevTab obcommand workspace:previous-tab
nmap [b :prevTab<CR>

exmap nextTab obcommand workspace:next-tab
nmap ]b :nextTab<CR>

" Close current tab/split
exmap closeTab obcommand workspace:close
nmap <Space>bd :closeTab<CR>

" Make new tab
exmap newTab obcommand workspace:new-tab
nmap <Space>bt :newTab<CR>

" Make new file
exmap newFile obcommand file-explorer:new-file
nmap <Space>bn :newFile<CR>

" Toggle task checkbox
exmap toggleChecklist obcommand editor:toggle-checklist-status
nmap <Space>x :toggleChecklist<CR>
vmap <Space>x :toggleChecklist<CR>

" Follow link under cursor (gd)
exmap followLink obcommand editor:follow-link
nmap gd :followLink<CR>

" ======================================================
" 7. Text Formatting
" ======================================================
" Bold
exmap toggleBold obcommand editor:toggle-bold
exmap surroundBold surround ** **
nmap <Space>mb :toggleBold<CR>
vmap <Space>mb :surroundBold<CR>gv

" Italic
exmap toggleItalic obcommand editor:toggle-italics
exmap surroundItalic surround * *
nmap <Space>mi :toggleItalic<CR>
vmap <Space>mi :surroundItalic<CR>gv

" Highlight
exmap toggleHighlight obcommand editor:toggle-highlight
exmap surroundHighlight surround == ==
nmap <Space>mh :toggleHighlight<CR>
vmap <Space>mh :surroundHighlight<CR>gv

" Lowercase
exmap textLowercase obcommand obsidian-text-format:lowercase
nmap <Space>cl :textLowercase<CR>
vmap <Space>cl :textLowercase<CR>gv

" Uppercase
exmap textUppercase obcommand obsidian-text-format:uppercase
nmap <Space>cu :textUppercase<CR>
vmap <Space>cu :textUppercase<CR>gv

" TItlecase
exmap textTitlecase obcommand obsidian-text-format:title-case
nmap <Space>ct :textTitlecase<CR>
vmap <Space>ct :textTitlecase<CR>gv

" Cycle Case
exmap textCyclecase obcommand obsidian-text-format:cycle-case
nmap <Space>cc :textCyclecase<CR>
vmap <Space>cc :textCyclecase<CR>gv

" Blockquotes
exmap toggleBlockquote obcommand editor:toggle-blockquote
nmap <Space>mq :toggleBlockquote<CR>
vmap <Space>mq :s/^/><Space>/<CR>
vmap <Space>mQ :s/^><Space>//<CR>
