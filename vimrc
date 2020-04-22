" LICENSE:
" suit your needs and to make the changes yours. Attribution to this vimrc
" is not required although is thanked.

" TABLE OF CONTENTS:
" 1. Generic settings
" 2. Vim-Plug plugins
" 3. Configure plugins
" 4. File settings
" 5. Specific filetype settings
" 6. Colors and UI
" 7. Maps and functions
" 8. Gnome Terminal
"

" ===================
" 1. GENERIC SETTINGS
" ===================

scriptencoding utf-16      " allow emojis in vimrc
set nocompatible " disable vi compatibility mode
set history=1000 " increase history size
set shell=/bin/zsh " set shell to zsh
set ttyfast           " should make scrolling faster
set lazyredraw        " should make scrolling faster
filetype plugin indent on  " try to recognize filetypes and load rel' plugins


" ===================
" 2. VIM-PLUG PLUGINS
" ===================
call plug#begin('~/.vim/plugged/')

" Plug-ins
Plug 'scrooloose/nerdtree'      " NERDTree... tree explorer for vim
Plug 'junegunn/fzf', { 'dir': ' ~/.fzf', 'do': './install --all' } " fzf greatness (fuzzy finding)
Plug 'junegunn/fzf.vim'         " fzf greatness (fuzzy finding)
Plug 'SirVer/ultisnips'         " modern snippets for vim
Plug 'honza/vim-snippets'       " vim snippets for UltiSnips ...
Plug 'tpope/vim-eunuch'         " Vim sugar for the UNIX shell commands that need it the most.
Plug 'jiangmiao/auto-pairs'     " Auto close matching pairs {} \"\", etc..
Plug 'valloric/matchtagalways'  " highlight open and close html tabs
Plug 'tpope/vim-obsession'      " save vim sessions
Plug 'ntpeters/vim-better-whitespace' " show trailing white spaces and allow deleting them
Plug 'mhinz/vim-startify'       " fancy vim start page
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } "Vastly improved Javascript indentation and syntax support
Plug 'othree/yajs.vim',         { 'for': 'javascript' } "Enhanced javascript syntax
Plug 'sbdchd/neoformat'         " Plugin for formatting code.
Plug 'neomake/neomake'          " staticly check code and highlight errors (async syntastic replacement)
Plug 'tpope/vim-fugitive'       " git awesomeness
Plug 'tpope/vim-commentary'     " Comment out code easily
Plug 'terryma/vim-multiple-cursors'  " Multiple cursor emulation (a la Sublime Text) using ctrl-n
Plug 'tpope/vim-abolish'        "easily search for, substitute, and abbreviate multiple variants of a word
Plug 'airblade/vim-gitgutter'   " Visual git gutter
Plug 'alvan/vim-closetag'       " Auto close (X)HTML tags
Plug 'duggiefresh/vim-easydir'  " A simple way to create, edit and save files and directories
Plug 'junegunn/limelight.vim'   " All the world's indeed a stage and we are merely players
Plug 'othree/javascript-libraries-syntax.vim'    "Syntax for JavaScript libraries
Plug 'tpope/vim-endwise'        " endwise.vim: wisely add end, in ruby, endfunction/endif/more in vim script, etc
Plug 'chrisbra/Colorizer'       " Color hex codes and color names.
Plug 'OrangeT/vim-csharp'       " Enhancement's to Vim's C-Sharp Functionality
Plug 'mustache/vim-mustache-handlebars' " Mustache and handlebars mode for vim
Plug 'elixir-editors/vim-elixir' " Elixir
Plug 'ryanoasis/vim-devicons' "Icons for vim

" Language frameworks support
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
Plug 'sovetnik/vim-hanami'      "Hanami support plugin
Plug 'rust-lang/rust.vim'       "Vim configuration for Rust.
Plug 'cespare/vim-toml'         "Vim syntax for TOML.
Plug 'racer-rust/vim-racer'     "Racer support for Vim
Plug 'othree/html5.vim'         "HTML5 omnicomplete and syntax
Plug 'Glench/Vim-Jinja2-Syntax' "An up-to-date jinja2 syntax file.

" Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'mhinz/vim-janah'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'dracula/vim'
Plug 'ajh17/Spacegray.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'raphamorim/lucario'
Plug 'AlessandroYorba/Sierra'
Plug 'nanotech/jellybeans.vim'
Plug 'ayu-theme/ayu-vim'

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


" ===================
" 3. Configure Plugin
" ===================

"NerdTree
" nnoremap <Leader>nt :NERDTreeToggle<CR>
"let NERDTreeQuitOnOpen=1 "Close when open a file
let NERDTreeWinSize=30
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore=['\.vim$', '\~$', '_build$', 'deps$']
map <C-x> :NERDTreeToggle<CR>

"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall
let g:user_emmet_leader_key='<C-e>'

"Vim-Jinja2-Syntax.
autocmd BufNewFile,BufRead *.tera set ft=jinja

"FzF
" set fzf's default input to AG instead of find. This also removes gitignore etc
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

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'


"Vim Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"Neoformat
let g:neoformat_try_formatprg = 1
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --print-width\ 120\ --parser\ flow\ --single-quote\ --trailing-comma\ es5
    autocmd BufWritePre *.js Neoformat
    autocmd BufWritePre *.css,*.scss Neoformat stylefmt
augroup END

"Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_vue_enabled_makers = ['eslint']

augroup NeomakeOnSave
  autocmd!
  autocmd! BufWritePost * Neomake
augroup END

"MatchTagAlways
let g:mta_filetypes = {
      \ 'jinja': 1,
      \ 'xhtml': 1,
      \ 'xml': 1,
      \ 'html': 1,
      \ 'django': 1,
      \ 'javascript.jsx': 1,
      \ 'eruby': 1,
      \ }

"CloseTabs
let g:closetag_filenames = '*.html,*.vue'

"Airline
let g:airline_mode_map = {
        \ '__' : '      ',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'v'  : 'V',
        \ 'V'  : 'VL',
        \ '^V' : 'VB',
        \ 'c'  : 'C',
        \ 's'  : 'S',
        \ 'S'  : 'SL',
        \ '^S' : 'SB',
        \ 't'  : 'T',
        \ }

"Vim-hanami
let g:hanami_open_strategy = 'vsplit'


"Rust
set hidden
let g:racer_cmd="/home/joselo/.cargo/bin/racer"
let g:racer_experimental_completer = 1

"Color
let g:colorizer_auto_filetype='css,html'

" ================
" 4. FILE SETTINGS
" ================

" 70s are over and swap files are part of the past.
" If you need to backup something, use Git, for God's sake.
set noswapfile
set nobackup

" Modify indenting settings
set autoindent              " autoindent always ON.
set expandtab               " To insert space characters whenever the tab key is pressed
set tabstop=2               " To insert 2 spaces for a tab
set shiftwidth=2            " Number of spaces to use for each step of (auto)indent.
set shiftround              " Round indent to multiple of 'shiftwidth'

" Modify some other settings about files
set encoding=utf-8             " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode


" =============================
" 5. SPECIFIC FILETYPE SETTINGS
" =============================

" Some programming languages work better when only 2 spaces padding is used.
autocmd FileType html,css,sass,scss,javascript setlocal sw=2 sts=2
autocmd FileType json setlocal sw=2 sts=2
autocmd FileType ruby,eruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2
autocmd FileType vue setlocal sw=2 sts=2
autocmd FileType vue syntax sync fromstart
autocmd FileType rust setlocal sw=2 sts=2


" ================
" 6. COLORS AND UI
" ================
" Are we supporting colors?
if &t_Co > 2 || has("gui_running")
    syntax on
    highlight ColorColumn ctermbg=7

    set termguicolors

   "- Only for gruvbox
   " set background=dark
   " colorscheme gruvbox
   " let g:airline_theme='gruvbox'
   " let g:gitgutter_override_sign_column_highlight = 0
   " highlight SignColumn ctermbg=235

   "- Only for papercolor
   " set background=light
   " let g:airline_theme='papercolor'
   " colorscheme PaperColor

   "- Only for janah theme
   " set background=dark
   " autocmd ColorScheme janah highlight Normal ctermbg=235
   " colorscheme janah
   " let g:airline_theme='minimalist'
   " let g:gitgutter_override_sign_column_highlight = 0
   " highlight SignColumn ctermbg=235

   "- Only for quantum
   " set background=dark
   " colorscheme quantum
   " let g:quantum_italics=1
   " let g:airline_theme='quantum'

   "- Only for dracula
   " color dracula
   " set background=dark
   " let g:airline_theme='dracula'
   " highlight Normal ctermfg=white ctermbg=233

   "- Only for spacegray
   " colorscheme spacegray
   " set background=dark
   " autocmd ColorScheme spacegray highlight Normal ctermbg=235
   " let g:airline_theme='hybrid'

   "- Only for Nord
   " set background=dark
   " colorscheme nord
   " let g:nord_italic_comments = 1
   " let g:airline_theme='nord'

   "- Only for spacegray
   " colorscheme iceberg
   " set background=dark
   " autocmd ColorScheme spacegray highlight Normal ctermbg=235
   " let g:airline_theme='hybrid'

   "- Only for lucario
   " colorscheme lucario
   " set background=dark
   " autocmd ColorScheme spacegray highlight Normal ctermbg=235
   " let g:airline_theme='hybrid'

   "- Only Sierra
   " let g:sierra_Twilight = 1
   " colorscheme sierra

   "- Only deep-space
   " set background=dark
   " set termguicolors
   " colorscheme deep-space
   " let g:airline_theme='deep_space'
   " let g:deepspace_italics=1

   "- Only Ayu
    colorscheme ayu
    "let ayucolor="light"  " for light version of theme
    "let ayucolor="mirage" " for mirage version of theme
    let ayucolor="dark"   " for dark version of theme
endif

" Trailing spaces
if &t_Co > 2 || has("gui_running")
    " Because we have color, colourize them
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    " Fallback
    set listchars=nbsp:☠,tab:▸␣ " Show symbols for weird characters and tabs
    set list                    " show all whitespaces as a character
endif

"set fillchars+=vert:\   " Remove unpleasant pipes from vertical splits
                        " Sauce on this: http://stackoverflow.com/a/9001540

set showmode            " always show which more are we in
set laststatus=2        " always show statusbar
set wildmenu            " enable visual wildmenu
set wildmode=list:longest,list:full " configure wildmenu

"set nowrap              " don't wrap long lines
set number              " show line numbers
set showmatch            " higlight matching parentheses and brackets

set hlsearch             " Highlight all search pattern matches

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" highlight fenced code blocks in markdown
let g:markdown_fenced_languages = [
      \ 'html',
      \ 'vim',
      \ 'js=javascript',
      \ 'json',
      \ 'ruby',
      \ 'sql',
      \ 'bash=sh'
      \ ]

" Powerline and powerfonts are required
let g:airline_powerline_fonts = 1


" =====================
" 7. MAPS AND FUNCTIONS
" =====================
let mapleader=","

" Make window navigation less painful.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*\\log\\*,*.log              " Etc.

" Working with buffers is cool.
set hidden
"map <C-N>  :bnext<CR>
"map <C-P>  :bprev<CR>
"imap <C-N> <Esc>:bnext<CR>a
"imap <C-P> <Esc>:bprev<CR>a

" Edit files in the same buffer directory
cnoremap e. edit <c-r>=expand("%:h")<cr>/

" Write files in the same buffer directory
cnoremap w. write <c-r>=expand("%:h")<cr>/

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" copy to system clipboard
noremap gy "+y

" copy whole file to system clipboard
nnoremap gY gg"+yG


" =================
" 8. Gui Terminal
" =================
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  set t_ut=

  "To Easy copy to clipboard
  set clipboard=unnamed

  "Disable sound error
  set visualbell

endif

" =========================
" 9. For specific languages
" =========================

au BufNewFile,BufRead *.json.jbuilder set ft=ruby

highlight NonText ctermbg=none
