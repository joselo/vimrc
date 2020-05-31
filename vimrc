syntax on                      "Enable Colors 
filetype plugin indent on      "Try to recognize filetypes and load rel' plugins

set number                     "Line Numbers
set nobackup                   "No Backup
set encoding=utf-8             "Always use unicode (god damnit, windows)
set nocompatible               "Disable vi compatibility mode
set autoindent                 "Autoindent always ON.
set showmatch                  "Higlight matching parentheses and brackets
set hlsearch                   "Highlight all search pattern matches
set laststatus=2               "Always show statusbar
set showmode                   "Always show which more are we in
set termguicolors              "Enable true colors support

"Expand tabs to spaces
set tabstop=2
set shiftwidth=2
set expandtab

"Edit files in the same buffer directory
cnoremap e. edit <c-r>=expand("%:h")<cr>/

"Write files in the same buffer directory
cnoremap w. write <c-r>=expand("%:h")<cr>/

"Vimgrep ignore files
set wildignore=*/node_modules/*,*/target/*,*/tmp/*,*/static/*

"Explorer
map <C-x> :Vexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide= '.*\.swp$,.*\.git,.*\_build,.*\tmp'

"PLUG-INS *********************************************************

call plug#begin('~/.vim/autoload/')
"fzf
"fzf greatness (fuzzy finding)
"https://github.com/junegunn/fzf
"https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'dir': ' ~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"vim-easydir
"A simple way to create, edit and save files and directories
"https://github.com/joselo/vimrc/blob/master/vimrc
Plug 'duggiefresh/vim-easydir'

"vim-eunuch
"Vim sugar for the UNIX shell commands that need it the most.
"https://github.com/tpope/vim-eunuch
Plug 'tpope/vim-eunuch' 

"matchtagalways
"Highlight open and close html tabs
"https://github.com/Valloric/MatchTagAlways
Plug 'valloric/matchtagalways'

"vim-elixir
"Elixir support for vim
"https://github.com/elixir-editors/vim-elixir
Plug 'elixir-editors/vim-elixir' " Elixir

"vim-closetag
"Auto close (X)HTML tags 
"https://github.com/alvan/vim-closetag
Plug 'alvan/vim-closetag'

"vim-commentary
"Comment stuff out.
"https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

"vim-gitgutter
"Plugin which shows git diff markers in the sign column  
"https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

"vim-fugitive
"A Git wrapper so awesome
"https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive' 

"indentLine
"Display the indention levels with thin vertical lines
"https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

"vim-multiple-cursors
"True Sublime Text style multiple selections for Vim 
"https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

"lightline
"A light and configurable statusline/tabline plugin for Vim
"https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

"## Themes ##

"ayu-vim
"https://github.com/ayu-theme/ayu-vim
Plug 'ayu-theme/ayu-vim' " or other package manager

call plug#end()

"fzf =============================================================
let g:fzf_layout = { 'down': '~50%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'

map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <C-f> :BLines<CR>
map <C-g> :Ag<CR>
map <C-h> :History<CR>

"Fzf Ack + Ag
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor 

  " Use Ag for Ack
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

"Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"matchtagalways =================================================
let g:mta_filetypes = {
      \ 'html': 1,
      \ 'eruby': 1,
      \ 'eelixir': 1,
      \ }

"indentLine ====================================================
let g:indentLine_setColors = 0

"lightline =================================================
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead', 'filename': 'LightlineFilename'
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"## Themes ##

"ayu-vim =======================================================
let ayucolor="dark"       "Can be: light, mirage, dark
colorscheme ayu       
