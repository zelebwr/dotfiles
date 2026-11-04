" ======================================================
" 1. Base Foundation & Leader Key Setup
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
" <leader>ff -> Quick Switcher (fzf.files equivalent)
exmap openSwitcher obcommand switcher:open
nmap <Space>ff :openSwitcher<CR>

" <leader>fg -> Global Search (fzf.live_grep equivalent)
exmap globalSearch obcommand omnisearch:show-modal
nmap <Space>fg :globalSearch<CR>

" <leader>pv and - -> File Explorer (oil.nvim equivalent)
exmap toggleExplorer obcommand file-explorer:open
nmap <Space>pv :toggleExplorer<CR>
nmap - :toggleExplorer<CR>

" <leader>fd -> Document Symbols / Outline
exmap openOutline obcommand outline:open
nmap <Space>fd :openOutline<CR>

" <leader>fh -> Command Palette / Help Tags
exmap openPalette obcommand command-palette:open
nmap <Space>fh :openPalette<CR>

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

" Toggle task checkbox
exmap toggleChecklist obcommand editor:toggle-checklist-status
nmap <Space>x :toggleChecklist<CR>
vmap <Space>x :toggleChecklist<CR>

" Follow link under cursor (gd)
exmap followLink obcommand editor:follow-link
nmap gd :followLink<CR>
