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

" Language support
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'

" Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'mhinz/vim-janah'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'dracula/vim'

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


" ===================
" 3. Configure Plugin
" ===================

"NerdTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=40

"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall
let g:user_emmet_leader_key='<C-e>'

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

"Fzf respect vim colors
function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd VimEnter,ColorScheme * call s:update_fzf_colors()
augroup END

"Vim Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"Neoformat
let g:neoformat_try_formatprg = 1
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript setlocal formatprg=prettier\
                                             \--stdin\
                                             \--print-width\ 80\
                                             \--single-quote\
                                             \--trailing-comma\ es5
    autocmd BufWritePre *.js, Neoformat
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

"let g:racer_cmd="/Users/danirod/.cargo/bin/racer"
"let $RUST_SRC_PATH="/usr/local/src/rustc/src"


" ================
" 6. COLORS AND UI
" ================
" Are we supporting colors?
if &t_Co > 2 || has("gui_running")
   syntax on
   highlight ColorColumn ctermbg=7

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
   " set termguicolors
   " colorscheme quantum
   " let g:quantum_italics=1
   " let g:airline_theme='quantum'

   "- Only for dracula
   color dracula
   let g:airline_theme='dracula'

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
"set number              " show line numbers
set showmatch            " higlight matching parentheses and brackets

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

" Working with buffers is cool.
set hidden
"map <C-N>  :bnext<CR>
"map <C-P>  :bprev<CR>
"imap <C-N> <Esc>:bnext<CR>a
"imap <C-P> <Esc>:bprev<CR>a

" Edit files in the same buffer directory
cnoremap ee edit <c-r>=expand("%:h")<cr>/

" Write files in the same buffer directory
cnoremap ww write <c-r>=expand("%:h")<cr>/

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

