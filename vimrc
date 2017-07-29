" LICENSE:
" You are free to read and study this bundle or snippets of it and to use
" it on your own vimrc settings. Feel free to tweak and adapt my vimrc to
" suit your needs and to make the changes yours. Attribution to this vimrc
" is not required although is thanked.

" TABLE OF CONTENTS:
" 1. Generic settings
" 2. Vim-Plug plugins
" 3. File settings
" 4. Specific filetype settings
" 5. Colors and UI
" 6. Maps and functions
" 7. Gnome Terminal

" ===================
" 1. GENERIC SETTINGS
" ===================
set nocompatible " disable vi compatibility mode
set history=1000 " increase history size
set shell=/bin/zsh " set shell to zsh


" =================
" 2. VIM-PLUG PLUGINS
" =================
call plug#begin('~/.vim/plugged/')

" Plug-ins
Plug 'scrooloose/nerdtree'  " NERDTree... tree explorer for vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf greatness (fuzzy finding)
Plug 'junegunn/fzf.vim'        " fzf greatness (fuzzy finding)
Plug 'SirVer/ultisnips'        " modern snippets for vim
Plug 'honza/vim-snippets'      " vim snippets for UltiSnips ...
Plug 'tpope/vim-eunuch'        " Vim sugar for the UNIX shell commands that need it the most.
Plug 'jiangmiao/auto-pairs'    " Auto close matching pairs {} \"\", etc..
Plug 'valloric/matchtagalways' " highlight open and close tabs
Plug 'tpope/vim-obsession'     " save vim sessions
Plug 'ntpeters/vim-better-whitespace' " show trailing white spaces and allow deleting them
Plug 'mhinz/vim-startify'      " fancy vim start page

" Language support
Plug 'alvan/vim-closetag'
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'

" Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tmux Vim-airline theme
"Plug 'edkolev/tmuxline.vim'


call plug#end()

" ================
" 3. FILE SETTINGS
" ================

" 70s are over and swap files are part of the past.
" If you need to backup something, use Git, for God's sake.
set noswapfile
set nobackup

" Modify indenting settings
set autoindent              " autoindent always ON.
set expandtab               " expand tabs
set shiftwidth=4            " spaces for autoindenting
set softtabstop=4           " remove a full pseudo-TAB when i press <BS>

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set hidden

" =============================
" 4. SPECIFIC FILETYPE SETTINGS
" =============================

" Some programming languages work better when only 2 spaces padding is used.
autocmd FileType html,css,sass,scss,javascript setlocal sw=2 sts=2
autocmd FileType json setlocal sw=2 sts=2
autocmd FileType ruby,eruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2
autocmd FileType vue setlocal sw=2 sts=2

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.erb,*.xml.erb,*.xml"

"let g:racer_cmd="/Users/danirod/.cargo/bin/racer"
"let $RUST_SRC_PATH="/usr/local/src/rustc/src"


" ================
" 5. COLORS AND UI
" ================
" Are we supporting colors?
if &t_Co > 2 || has("gui_running")
   syntax on
   "set colorcolumn=80
   highlight ColorColumn ctermbg=7
   set background=dark
   "colorscheme base16-default-dark
   "colorscheme jellybeans
   colorscheme gruvbox
endif

" Extra fancyness if full pallete is supported.
if &t_Co >= 256 || has("gui_running")
"    set cursorline
"    set cursorcolumn
endif

" Trailing spaces
if &t_Co > 2 || has("gui_running")
    " Because we have color, colourize them
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    " Fallback
    set listchars=trail:~
    set list
endif

set fillchars+=vert:\   " Remove unpleasant pipes from vertical splits
                        " Sauce on this: http://stackoverflow.com/a/9001540

set showmode            " always show which more are we in
set laststatus=2        " always show statusbar
set wildmenu            " enable visual wildmenu

set nowrap              " don't wrap long lines
"set number              " show line numbers
"set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets

let g:airline_powerline_fonts = 1    " Powerline and powerfonts are required
let g:airline_theme='jellybeans'   "Powerine Airline Theme

" =====================
" 6. MAPS AND FUNCTIONS
" =====================
let mapleader=","

" Make window navigation less painful.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Working with buffers is cool.
set hidden
"map <C-N>  :bnext<CR>
"map <C-P>  :bprev<CR>
"imap <C-N> <Esc>:bnext<CR>a
"imap <C-P> <Esc>:bprev<CR>a

" Edit files in the same buffer directory
cabbr %% <C-R>=expand('%:p:h')<CR>

" Relative numbering is pretty useful for motions (3g, 5k...). However I'd
" prefer to have a way for switching relative numbers with a single map.
"nmap <F5> :set invrelativenumber<CR>
"imap <F5> <ESC>:set invrelativenumber<CR>a

map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=40

"Emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"FzF
" set fzf's default input to AG instead of find. This also removes gitignore etc
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <C-f> :BLines<CR>
map <C-g> :Ag<CR>

" =====================
" 7. Gnome Terminal
" =====================
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  set t_ut=

  "To Easy copy to clipboard
  set clipboard=unnamed

  "Disable sound error
  set visualbell
endif
