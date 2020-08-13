syntax on                      "Enable Colors
filetype plugin indent on      "Try to recognize filetypes and load rel' plugins

set number                     "Line Numbers
set encoding=utf-8             "Always use unicode (god damnit, windows)
set nocompatible               "Disable vi compatibility mode
set autoindent                 "Autoindent always ON.
set showmatch                  "Higlight matching parentheses and brackets
set hlsearch                   "Highlight all search pattern matches
set laststatus=2               "Always show statusbar
set showmode                   "Always show which more are we in
set termguicolors              "Enable true colors support
set colorcolumn=120            "Ruler at a specific column
set hidden                     "Keep buffer unsaved if navigate accross buffers
set expandtab                  "To insert space characters whenever the tab key is pressed

"Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

"No Backup
set noswapfile
set nobackup

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

"Terminal
map <C-t> :below terminal<CR>
tnoremap <C-p> <C-w>:Files<CR>
tnoremap <C-b> <C-w>:Buffers<CR>
tnoremap <C-f> <C-w>:BLines<CR>
tnoremap <C-g> <C-w>:Ag<CR>
tnoremap <C-h> <C-w>:History<CR>

"Open path in a buffer
nnoremap <C-W><C-S-F> <C-W>vgF

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

"vim-multiple-cursors
"True Sublime Text style multiple selections for Vim
"https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

"vim-better-whitespace
"Better whitespace highlighting for Vim
"https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

"lightline
"A light and configurable statusline/tabline plugin for Vim
"https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

"auto-pairs
"Vim plugin, insert or delete brackets, parens, quotes in pair.
"https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

"ultisnips
"modern snippets for vim
"https://github.com/honza/vim-snippets
Plug 'SirVer/ultisnips'

"vim-snippets
"vim snippets for UltiSnips
"https://github.com/honza/vim-snippets
Plug 'honza/vim-snippets'

"vim-prosession
"https://github.com/dhruvasagar/vim-prosession
"A VIM plugin to handle sessions like a pro.
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

"nerdtree
"https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

"vim-autotag
"https://github.com/craigemery/vim-autotag
Plug 'craigemery/vim-autotag'

"## Languages ##

"General
Plug 'vim-test/vim-test'

"Elixir:
"Elixir support for vim
Plug 'elixir-editors/vim-elixir'


"## Themes ##

"ayu-vim
"https://github.com/ayu-theme/ayu-vim
Plug 'ayu-theme/ayu-vim' " or other package manager

"gruvbox
"https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

"papercolor-theme
"https://github.com/NLKNguyen/papercolor-theme
Plug 'NLKNguyen/papercolor-theme'

"tokyonight-vim
"https://github.com/ghifarit53/tokyonight-vim/
Plug 'ghifarit53/tokyonight-vim'

call plug#end()

"fzf =============================================================
let g:fzf_preview_window = 'up:50%'
let g:fzf_layout = { 'down': '~100%' }
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

"lightline =================================================
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead', 'filename': 'LightlineFilename'
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"nerdtree =================================================
map <C-x> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.git$', '^_build$', '^deps$']
augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end

"vim-tests ===============================================
let test#strategy = "vimterminal"
let test#vim#term_position = "rightb vert"


"## Themes ##

""ayu-vim ======================================================
" let ayucolor="dark"       "Can be: light, mirage, dark
" colorscheme ayu

"gruvbox =======================================================
" set background=dark
" colorscheme gruvbox
" let g:gruvbox_contrast_dark='hard'

"PaperColor ====================================================
set background=dark "light
colorscheme PaperColor
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

"tokyonight-vim ================================================
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" colorscheme tokyonight

"## CUSTOM ##

"Alacritty
if &term == "alacritty"
  let &term = "xterm-256color"
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
endif
