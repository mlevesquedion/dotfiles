set nocompatible
filetype off
" WARNING: these lines have to be at the top of the file

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " Plugin manager, has to be loaded first
    Plugin 'gmarik/Vundle.vim'

    " Formatting
    Plugin 'Chiel92/vim-autoformat'
    let g:autoformat_autoindent = 0
    let g:autoformat_retab = 0
    let g:autoformat_remove_trailing_spaces = 0
    augroup V_FormatOnSave
      autocmd!
      autocmd BufWrite * :Autoformat
    augroup end

    " Linting
    Plugin 'dense-analysis/ale'

    " Autocompletion
    Plugin 'Valloric/YouCompleteMe'
    " Do not insert newline when accepting with Enter
    inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
    " No preview window
    set completeopt-=preview

    " Match more than just brackets
    Plugin 'tmhedberg/matchit'

    " Go
    Plugin 'fatih/vim-go'
    let g:go_fmt_command = "goimports"

    " Git
    Plugin 'tpope/vim-fugitive'

    " Syntax highlighting
    Plugin 'vim-syntastic/syntastic'
    let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
    let g:syntastic_enable_racket_racket_checker = 1
    Plugin 'nlknguyen/papercolor-theme'

    Plugin 'tmhedberg/SimpylFold'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-commentary'

    " Automatically close pairs of characters, e.g. brackets and quotes
    Plugin 'Townk/vim-autoclose'

    " Racket
    Plugin 'wlangstroth/vim-racket'

    " Bracket colorizer
    Plugin 'luochen1990/rainbow'
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \ 'ctermfgs': ['Magenta', 'Yellow', 'Cyan'],
    \ }

    " Snippets
    Plugin 'honza/vim-snippets'
    Plugin 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    " Cool status bar
    Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
call vundle#end()

set t_co=256
set background=dark
colorscheme PaperColor
syntax on

filetype plugin indent on
runtime macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set encoding=utf-8
set foldlevel=99
set foldmethod=syntax
set hidden
set history=1000
set hlsearch
set incsearch
set laststatus=2
set nrformats-=octal
set showcmd
set showmatch
set smartcase
set smarttab
set timeoutlen=300
set undodir=~/.vim/undodir
set undofile
set wildmenu
set wildmode=full

" Line numbers
set number
set relativenumber

" Spaces > Tabs
set expandtab
set softtabstop=2  " Because of expandtab, this is used instead of tabstop
set shiftwidth=2

" Show unprintable characters, e.g. EOL
set list

" Python
augroup V_Python
  autocmd!
  highlight TrailingComma ctermbg=red ctermfg=white
  autocmd ColorScheme *.py highlight TrailingComma ctermbg=red ctermfg=white
  match TrailingComma /,$/
  autocmd BufNewFile,BufRead *.py
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set foldmethod=indent |
      \ set fileformat=unix |
  autocmd BufWritePre *.py :!pytest -vv -s
augroup end

augroup V_Golang
  autocmd!
  autocmd BufWritePre *.go :GoTest
augroup end

" Text outline files
augroup V_TextOutline
  autocmd!
  autocmd BufWrite *.outline :!outgraph %
  autocmd BufNewFile,BufRead *.outline
      \ set softtabstop=1 |
      \ set shiftwidth=1 |
      \ set foldmethod=indent |
      \ set fileformat=unix |
augroup end

" Racket
augroup V_Racket
  autocmd!
  autocmd BufReadPost *.rkt,*.rktl set filetype=racket
  autocmd filetype racket set lisp
  autocmd filetype racket set autoindent
augroup end

" Prevent background
noremap <C-z> <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Select all
nnoremap <leader>a ggVG

" Edit/Source vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Insert lines without entering Insert mode
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" Open Command-Line window with history of ...
" Ex commands
nnoremap <leader>: q:
nnoremap q: <NOP>
" Searches
nnoremap <leader>/ q/
nnoremap <leader>? q?
nnoremap q/ <NOP>
nnoremap q? <NOP>

" Visually select next search match
nnoremap <leader>n gn

" Clear search
nnoremap <leader>l :nohlsearch<CR>

" Paste last yank
nnoremap <leader>p "0p

" Trim one character off end of current line
nnoremap <leader>e :normal mzLx`z<CR>

" Trim one word off end of current line
nnoremap <leader>E :normal mzLdiW`z<CR>

" Go to decl/defn
nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Duplicate character
nnoremap <leader>d ylp

" Visual Block mode
nnoremap <leader>v <C-v>

" Surround
nmap <leader>' ysiw'
nmap <leader>" ysiw"
nmap <leader>( ysiw)
nmap <leader>) ysiw)
nmap <leader>[ ysiw]
nmap <leader>] ysiw]
nmap <leader>{ ysiw{
nmap <leader>} ysiw{

" netrw
nnoremap <leader>x :Vexplore<CR>

" Count occurrences
nnoremap <leader>c :%s///n<left><left><left>

" Global replace
nnoremap <leader>r gD:%s/<C-R>///gc<left><left><left>

" Quick quit
nnoremap <leader>q :q!<CR>

" Quick toggle last two jump places
nnoremap <leader><leader> :normal! ''<CR>

" Swap words
" Forward
nnoremap <leader>w diwwviwplbhP
" Backward
nnoremap <leader>W diwbviwplp

" Swap arguments
" Forward
nnoremap <leader>s diwwviwpF,P
" Backward
nnoremap <leader>S diwF,bviwpWP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONTROL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move by block
nnoremap <C-j> }
nnoremap <C-k> {

" Save
nnoremap <C-s> :w<cr>

" Copy, Cut, Paste (clipboard)
vnoremap <C-c> "+ygv"*y
vnoremap <C-x> "+ygv"*ygvd
nnoremap <C-v> "+p

" Undo, Redo
nnoremap <C-z> u
nnoremap <C-x> <C-r>
nnoremap <C-r> <NOP>

" Navigate jump list
nnoremap <C-h> <C-o>
nnoremap <C-o> <NOP>
nnoremap <C-l> <C-i>
nnoremap <C-i> <NOP>

" Jump to end of line
inoremap <C-b> <C-o>_
inoremap <C-e> <C-o>$

" Jump to below line
inoremap <C-o> <C-o>o

" Delete 'til end of line
inoremap <C-d> <C-o>d$

" Enter Insert-Normal mode
inoremap <C-n> <C-o>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOTION MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move to beginning/end of line
nnoremap H _
nnoremap L $
nnoremap 0 <NOP>
nnoremap _ <NOP>
nnoremap $ <NOP>
vnoremap H _
vnoremap L $
vnoremap 0 <NOP>
vnoremap _ <NOP>
vnoremap $ <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NORMAL MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank 'til end of line
nnoremap Y y$

" Prevent open man page for symbol under cursor
nnoremap K k

" Add numbered movements to jump list
nnoremap <expr> k (v:count > 2 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 2 ? "m'" . v:count : '') . 'j'

" Always use very magic mode for searching
nnoremap / /\v
nnoremap ? ?\v

" Recall last command or search
nnoremap :: :<Up>
nnoremap // /<Up>
nnoremap ?? ?<Up>

" Select last pasted text
noremap gV `[v`]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Escape
inoremap jk <ESC>
inoremap <ESC> <c-o><ESC>
inoremap <C-[> <c-o><ESC>

" Quick insert last yank/delete
inoremap <C-r><C-r> <C-r>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Escape
vnoremap <leader><leader> <ESC>
vnoremap <ESC> <NOP>
vnoremap <C-[> <NOP>

" Move block of text
vnoremap <C-j> :m '>+1<cr>gv=gv
vnoremap <C-k> :m '<-2<cr>gv=gv

" Disable Select mode
vnoremap <C-g> <NOP>

" Indent in visual mode
vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISCELLANEOUS
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
augroup V_DeleteWhitespaceOnSave
    autocmd!
    autocmd BufWritePre * :call <SID>StripTrailingWhitespace()
augroup end

" Disable the mouse
" THIS DOESN'T ACTUALLY WORK MAYBE TRY RECOMPILING WITHOUT MOUSE?
set mouse=
set ttymouse=

" Keep cursor centered on screen
augroup vcentercursor
  au!
  au bufenter,winenter,winnew,vimresized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup end

" Return to last edit position when opening files (You want this!)
augroup V_ReopenAtLastEdit
  autocmd!
  autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DELETE BACK TO CHARACTER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-f>! <C-o>dF!<C-o>x
inoremap <C-f>" <C-o>dF"<C-o>x
inoremap <C-f># <C-o>dF#<C-o>x
inoremap <C-f>$ <C-o>dF$<C-o>x
inoremap <C-f>% <C-o>dF%<C-o>x
inoremap <C-f>& <C-o>dF&<C-o>x
inoremap <C-f>' <C-o>dF'<C-o>x
inoremap <C-f>( <C-o>dF(<C-o>x
inoremap <C-f>) <C-o>dF)<C-o>x
inoremap <C-f>* <C-o>dF*<C-o>x
inoremap <C-f>+ <C-o>dF+<C-o>x
inoremap <C-f>, <C-o>dF,<C-o>x
inoremap <C-f>- <C-o>dF-<C-o>x
inoremap <C-f>. <C-o>dF.<C-o>x
inoremap <C-f>/ <C-o>dF/<C-o>x
inoremap <C-f>0 <C-o>dF0<C-o>x
inoremap <C-f>1 <C-o>dF1<C-o>x
inoremap <C-f>2 <C-o>dF2<C-o>x
inoremap <C-f>3 <C-o>dF3<C-o>x
inoremap <C-f>4 <C-o>dF4<C-o>x
inoremap <C-f>5 <C-o>dF5<C-o>x
inoremap <C-f>6 <C-o>dF6<C-o>x
inoremap <C-f>7 <C-o>dF7<C-o>x
inoremap <C-f>8 <C-o>dF8<C-o>x
inoremap <C-f>9 <C-o>dF9<C-o>x
inoremap <C-f>: <C-o>dF:<C-o>x
inoremap <C-f>; <C-o>dF;<C-o>x
inoremap <C-f>< <C-o>dF<<C-o>x
inoremap <C-f>= <C-o>dF=<C-o>x
inoremap <C-f>> <C-o>dF><C-o>x
inoremap <C-f>? <C-o>dF?<C-o>x
inoremap <C-f>@ <C-o>dF@<C-o>x
inoremap <C-f>A <C-o>dFA<C-o>x
inoremap <C-f>B <C-o>dFB<C-o>x
inoremap <C-f>C <C-o>dFC<C-o>x
inoremap <C-f>D <C-o>dFD<C-o>x
inoremap <C-f>E <C-o>dFE<C-o>x
inoremap <C-f>F <C-o>dFF<C-o>x
inoremap <C-f>G <C-o>dFG<C-o>x
inoremap <C-f>H <C-o>dFH<C-o>x
inoremap <C-f>I <C-o>dFI<C-o>x
inoremap <C-f>J <C-o>dFJ<C-o>x
inoremap <C-f>K <C-o>dFK<C-o>x
inoremap <C-f>L <C-o>dFL<C-o>x
inoremap <C-f>M <C-o>dFM<C-o>x
inoremap <C-f>N <C-o>dFN<C-o>x
inoremap <C-f>O <C-o>dFO<C-o>x
inoremap <C-f>P <C-o>dFP<C-o>x
inoremap <C-f>Q <C-o>dFQ<C-o>x
inoremap <C-f>R <C-o>dFR<C-o>x
inoremap <C-f>S <C-o>dFS<C-o>x
inoremap <C-f>T <C-o>dFT<C-o>x
inoremap <C-f>U <C-o>dFU<C-o>x
inoremap <C-f>V <C-o>dFV<C-o>x
inoremap <C-f>W <C-o>dFW<C-o>x
inoremap <C-f>X <C-o>dFX<C-o>x
inoremap <C-f>Y <C-o>dFY<C-o>x
inoremap <C-f>Z <C-o>dFZ<C-o>x
inoremap <C-f>[ <C-o>dF[<C-o>x
inoremap <C-f>\ <C-o>dF\<C-o>x
inoremap <C-f>] <C-o>dF]<C-o>x
inoremap <C-f>^ <C-o>dF^<C-o>x
inoremap <C-f>_ <C-o>dF_<C-o>x
inoremap <C-f>` <C-o>dF`<C-o>x
inoremap <C-f>a <C-o>dFa<C-o>x
inoremap <C-f>b <C-o>dFb<C-o>x
inoremap <C-f>c <C-o>dFc<C-o>x
inoremap <C-f>d <C-o>dFd<C-o>x
inoremap <C-f>e <C-o>dFe<C-o>x
inoremap <C-f>f <C-o>dFf<C-o>x
inoremap <C-f>g <C-o>dFg<C-o>x
inoremap <C-f>h <C-o>dFh<C-o>x
inoremap <C-f>i <C-o>dFi<C-o>x
inoremap <C-f>j <C-o>dFj<C-o>x
inoremap <C-f>k <C-o>dFk<C-o>x
inoremap <C-f>l <C-o>dFl<C-o>x
inoremap <C-f>m <C-o>dFm<C-o>x
inoremap <C-f>n <C-o>dFn<C-o>x
inoremap <C-f>o <C-o>dFo<C-o>x
inoremap <C-f>p <C-o>dFp<C-o>x
inoremap <C-f>q <C-o>dFq<C-o>x
inoremap <C-f>r <C-o>dFr<C-o>x
inoremap <C-f>s <C-o>dFs<C-o>x
inoremap <C-f>t <C-o>dFt<C-o>x
inoremap <C-f>u <C-o>dFu<C-o>x
inoremap <C-f>v <C-o>dFv<C-o>x
inoremap <C-f>w <C-o>dFw<C-o>x
inoremap <C-f>x <C-o>dFx<C-o>x
inoremap <C-f>y <C-o>dFy<C-o>x
inoremap <C-f>z <C-o>dFz<C-o>x
inoremap <C-f>{ <C-o>dF{<C-o>x
inoremap <C-f>} <C-o>dF}<C-o>x
inoremap <C-f>~ <C-o>dF~<C-o>x
