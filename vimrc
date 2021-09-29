syntax on                      "Enable Colors
filetype plugin indent on      "Try to recognize filetypes and load rel' plugins

set number                     "Line Numbers
set encoding=utf-8             "Always use unicode (god damnit, windows)
set nocompatible               "Disable vi compatibility mode
set autoindent                 "Autoindent always ON.
set showmatch                  "Show matching brackets
set nostartofline              "Leave my cursor where it was
set hlsearch                   "Highlight all search pattern matches
set laststatus=2               "Always show statusbar
set showmode                   "Always show which more are we in
set termguicolors              "Enable true colors support
set colorcolumn=120            "Ruler at a specific column
set hidden                     "Keep buffer unsaved if navigate accross buffers
set expandtab                  "To insert space characters whenever the tab key is pressed

" Disable Highlight Matched Parentheses
let g:loaded_matchparen=1

"leader key
let mapleader = ","

"Copy to clipboard
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>

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
tnoremap <C-x> <C-w>:NERDTreeToggle<CR>

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
" Plug 'tpope/vim-fugitive', { 'branch': 'release' }

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

"vim-css-color
"https://github.com/ap/vim-css-color
Plug 'ap/vim-css-color'

"tagbar
"https://github.com/preservim/tagbar
Plug 'preservim/tagbar'

"plugin
"https://github.com/tpope/vim-dadbod
Plug 'tpope/vim-dadbod'

"## Languages ##

"General
Plug 'vim-test/vim-test'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"Elixir:
"Elixir support for vim
Plug 'elixir-editors/vim-elixir'
"Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}


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

"Rigellute/rigel
"https://github.com/Rigellute/rigel
Plug 'Rigellute/rigel'

"pineapplegiant/spaceduck
"https://github.com/pineapplegiant/spaceduck
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

"fenetikm/falcon
"https://github.com/fenetikm/falcon
Plug 'fenetikm/falcon'

call plug#end()

"fzf =============================================================
" let g:fzf_preview_window = ['up:50%', 'ctrl-/']
let g:fzf_layout = { 'down': '~50%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

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
let NERDTreeIgnore = ['\.git$', '^_build$', '^deps$', '^cover$']
augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end

"vim-tests ===============================================
let test#strategy = "vimterminal"
let test#vim#term_position = "rightb"
nmap <leader>t  :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>


"tagbar ==================================================
nmap <F8> :TagbarToggle<CR>

"Elixir
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }

"## Themes ##

"gruvbox =======================================================
function! GruvboxTheme()
  set background=dark
  " set background=light
  colorscheme gruvbox
  let g:gruvbox_contrast_dark='hard'
  let g:lightline.colorscheme = 'gruvbox'
endfunction

"falcon =======================================================
function! FalconTheme()
  " set background=dark
  set termguicolors

  let g:falcon_background = 0
  let g:falcon_inactive = 1

  colorscheme falcon

  let g:falcon_lightline = 1
  let g:lightline.colorscheme = 'falcon'

  colorscheme falcon
endfunction

"PaperColor ====================================================
function! PaperColorTheme()
  " set background=dark
  set background=light
  colorscheme PaperColor
  let g:lightline.colorscheme = 'PaperColor'

  let g:PaperColor_Theme_Options = {
    \   'theme': {
    \     'default': {
    \       'transparent_background': 1
    \     }
    \   }
    \ }

  let $BAT_THEME='base16-256'
endfunction

" call FalconTheme()
" call GruvboxTheme()
call PaperColorTheme()

"## CUSTOM ##

"Alacritty
if &term == "alacritty"
  let &term = "xterm-256color"
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
  hi! Terminal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
endif
