"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These lines have to be at the top of the file
set nocompatible
filetype off
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" dracula/vim
let g:dracula_italic = 0
let g:dracula_colorterm = 0

" luochen1990/rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
   \ 'ctermfgs': ['Magenta', 'Yellow', 'Cyan'],
   \ }

" dominikduda/vim_current_word
" Made some changes to the plugin code directly due to ordering dependencies:
" highlights have to be overriden before plugin is loaded, but after
" colorscheme has been set (colorscheme dracula comes from a plugin)
" Changes:
" hi {CurrentWord,CurrentWordTwins} cterm=bold

" junegunn/fzf.vim
nnoremap <C-b> :BLines<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-o> :History<CR>
" Have to use the below workaround because the bang commands insert "I",
" sometimes "II" in the input prompt on startup
let g:fzf_layout = { 'window': 'enew' }  

" machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 300
let g:highlightedyank_highlight_in_visual = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/dominikduda/vim_current_word'
Plug 'https://github.com/dracula/vim'
Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/nelstrom/vim-visual-star-search'
Plug 'https://github.com/luochen1990/rainbow'
Plug 'https://github.com/rhysd/clever-f.vim'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/machakann/vim-highlightedyank'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
highlight Normal ctermbg=None
colorscheme dracula

" Misc QOL
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set encoding=utf-8
set foldmethod=syntax
set hidden
set history=10000
set laststatus=2
set noswapfile
set nrformats-=octal
set showcmd
set smarttab
set timeoutlen=300
set updatetime=100
set undodir=~/.vim/undodir
set undofile
set wildmenu
set wildmode=full

" Don't show macros in action
set lazyredraw

" Cursor
set cursorline
set cursorcolumn

" Line numbers
set number
set relativenumber

" Spaces > Tabs
set expandtab
set softtabstop=4  " Because of expandtab, this is used instead of tabstop
set shiftwidth=4

" Show unprintable characters, e.g. EOL
set list
set listchars=tab:░░

" Yank 'til end of line
nnoremap Y y$

" Visual 'til end of line
nnoremap vv V
nnoremap V v$

" Don't move cursor back when leaving insert mode
autocmd InsertLeave * :normal! `^
set virtualedit=onemore

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISABLES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Send to background
noremap <C-z> <NOP>

" Ex mode
nnoremap Q :q!<CR>

" Disable Select mode
vnoremap <C-g> <NOP>

" Delete lines and insert
nnoremap S <nop>

" Replace mode
nnoremap R <NOP>

" Mouse
set mouse=
set ttymouse=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC COMMANDS FROM OTHER EDITORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Select all
nnoremap <C-a> ggVG

" Save
nnoremap <C-s> :w<cr>

" Copy, Cut, Paste (clipboard)
vnoremap <C-c> "+ygv"*y
vnoremap <C-x> "+ygv"*ygvd

" Undo, Redo
nnoremap <C-z> u
nnoremap <C-x> <C-r>

" Toggle comment (requires tpope/vim-commentary plugin)
nmap <C-_> gcc
vmap <C-_> gc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" MOVEMENT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Navigate jump list
nnoremap <C-h> <C-o>
nnoremap <C-l> <C-i>

" Move by visual lines
nnoremap k gk
nnoremap j gj

" Add numbered movements to jump list
nnoremap <expr> k (v:count > 1 ? "m'" . v:count . 'k' : 'gk')
nnoremap <expr> j (v:count > 1 ? "m'" . v:count . 'j' : 'gj')
nnoremap gj j
nnoremap gk k

" Quick toggle last two jump places
nnoremap <leader><leader> :normal! ''<CR>
vnoremap <leader><leader> :normal! ''<CR>

" Move to beginning/end of line
nnoremap H _
nnoremap L $
vnoremap H _
vnoremap L $

" Move by section
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hlsearch
set incsearch
set showmatch

" searches with a capital are case sensitive
set smartcase
" searches with no capitals are case insensitive
set ignorecase

" Clear search
nnoremap <leader>l :nohlsearch<CR>

" Search for selection
vnoremap / y/<C-r>"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMAND MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Write file that was opened without privileges
cnoremap w!! w !sudo tee % > /dev/null

" Edit command
cnoremap <C-e> <C-f>
cnoremap <C-f> <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Escape
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>
inoremap jK <ESC>

" Quick insert last yank/delete
inoremap <C-r><C-r> <C-r>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Alternative escape
vnoremap <leader><leader> <ESC>

" Move block of text
vnoremap <C-j> :m '>+1<cr>gv=gv
vnoremap <C-k> :m '<-2<cr>gv=gv

" Indent in visual mode
vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC HELPERS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart pasting
inoremap <special> <expr> <ESC>[200~ Xtermpastebegin()
function! Xtermpastebegin()
 set pastetoggle=<ESC>[201~
 set paste
 return ""
endfunction

" Whitespace
function! <SID>StripTrailingWhitespace()
 let l = line(".")
 let c = col(".")
 %s/\s\+$//e
 call cursor(l, c)
endfun

" Keep cursor centered on screen
augroup V_CenterCursor
 autocmd!
 autocmd BufEnter,WinEnter,WinNew,VimResized *,*.*
    \ let &scrolloff=winheight(win_getid())/2
augroup end

" Return to last edit position when opening files
augroup V_ReopenAtLastEdit
 autocmd!
 autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\" "|
    \ endif
augroup end
