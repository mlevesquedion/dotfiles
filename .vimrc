set nocompatible
filetype off
" WARNING: these lines have to be at the top of the file

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin manager, has to be loaded first
Plugin 'gmarik/Vundle.vim'

" Git
Plugin 'airblade/vim-gitgutter'

" TOML
Plugin 'cespare/vim-toml'

" Additional text objects
Plugin 'wellle/targets.vim'

" Visual star search
Plugin 'bronson/vim-visual-star-search'

" Better [fF] and [tT]
Plugin 'rhysd/clever-f.vim'

" Extra endings
Plugin 'tpope/vim-endwise'

" HTML
Plugin 'alvan/vim-closetag'

" Close bracket on <CR>
Plugin 'rstacruz/vim-closer'

" Templates
Plugin 'tibabit/vim-templates'

" Vue
Plugin 'posva/vim-vue'

" Rust
" Plugin 'rust-lang/rust.vim'
" let g:rustfmt_autosave = 1
Plugin 'racer-rust/vim-racer'
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

" Formatting
Plugin 'Chiel92/vim-autoformat'
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1
let g:formatters_python = ['black']

function! ToggleAutoformat()
 if g:autoformat_autoindent
  let g:autoformat_autoindent = 0
  let g:autoformat_retab = 0
 else
  let g:autoformat_autoindent = 1
  let g:autoformat_retab = 1
 endif
endfunction

augroup V_FormatOnSave
 autocmd!
 autocmd BufEnter *.outline let b:autoformat_autoindent=0
 autocmd BufEnter *.outline let b:autoformat_retab=0
 autocmd BufWritePre * :Autoformat
augroup end

" Linting
Plugin 'dense-analysis/ale'
let g:ale_linters = {'python': []}
let g:ale_echo_cursor = 0  " prevent cursor from disappearing on lines with error highlights

" Autocompletion
Plugin 'Valloric/YouCompleteMe'
" Do not insert newline when accepting with Enter
" inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
" No preview window
set completeopt-=preview

" Match more than just brackets
Plugin 'tmhedberg/matchit'

" Go
Plugin 'fatih/vim-go'

let g:go_fmt_command = "goimports"

let g:go_doc_keywordprg_enabled = 0

let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment', 'comment']

let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1

let g:go_list_type = "quickfix"

let g:go_auto_type_info = 1

let g:go_auto_sameids = 1

" Syntax highlighting
Plugin 'vim-syntastic/syntastic'
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-commentary'

" Easily manipulate surrounding characters
Plugin 'tpope/vim-surround'
" Convenient shortcut
" nmap m ysiw
" vmap m S

" Dracula
Plugin 'dracula/vim'

" LaTeX
Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
" let g:vimtex_latexmk_callback = 1
" let g:vimtex_latexmk_continuous = 1
" let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

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
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"

" Ack
Plugin 'mileszs/ack.vim'

" Cool status bar
Plugin 'vim-airline/vim-airline'

" Hex colors
Plugin 'Colorizer'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CLASSICS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Select all
nnoremap <C-a> ggVG

" Save
nnoremap <C-s> :w<cr>

" Copy, Cut, Paste (clipboard)
vnoremap <C-c> "+ygv"*y
vnoremap <C-x> "+ygv"*ygvd
nnoremap <C-v> "+p

" Undo, Redo
nnoremap <C-z> u
nnoremap <C-x> <C-r>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Edit/Source vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Open Command-Line window with history of ...
" Ex commands
nnoremap <leader>: q:
nnoremap q: <NOP>
" Searches
nnoremap <leader>/ q/
nnoremap <leader>? q?
nnoremap q/ <NOP>
nnoremap q? <NOP>

" Trim one character off end of current line
nnoremap <leader>e :normal mzLx`z<CR>

" Trim one word off end of current line
nnoremap <leader>E :normal mzLdiW`z<CR>

" Go to decl/defn
nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Visual Block mode
nnoremap <leader>v <C-v>

" Open explorer
nnoremap <leader>x :Vexplore<CR>

" Quick toggle last two jump places
nnoremap <leader><leader> :normal! ''<CR>
vnoremap <leader><leader> :normal! ''<CR>

" Write inside brackets
nnoremap <leader>i $i<CR><ESC>O

" Switch between recent files
nnoremap <C-f> <C-^>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:dracula_italic = 0
let g:dracula_colorterm = 0
highlight Normal ctermbg=None
colorscheme dracula
syntax on

filetype plugin indent on
runtime macros/matchit.vim

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set encoding=utf-8
set foldmethod=syntax
set hidden
set history=1000
set laststatus=2
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
set softtabstop=2  " Because of expandtab, this is used instead of tabstop
set shiftwidth=2

" Show unprintable characters, e.g. EOL
set list
set listchars=tab:░░

augroup V_Graphviz
 autocmd!
 autocmd BufWritePost *.dot silent! execute "!fdp % -Tpdf > %.pdf && nohup evince %.pdf >/dev/null 2>&1 &" | redraw!
augroup end

" LATEX - latex
augroup V_LaTeX
 autocmd!
 autocmd BufNewFile,BufRead *.tex
    \ setlocal softtabstop=1 |
    \ setlocal shiftwidth=1 |
    \ setlocal foldmethod=indent |
    \ setlocal fileformat=unix |
 autocmd BufWritePost *.tex silent! execute "!latexmk % --pdf && nohup evince %:t:r.pdf >/dev/null 2>&1 &" | redraw!
 autocmd VimLeave *.tex silent! execute "!rm *aux; rm *latexmk; rm *log; rm *syntex.gz; rm *.fls"
augroup end

" minizinc
augroup V_MiniZinc
 autocmd!
 autocmd BufNewFile,BufRead *.mzn nnoremap <buffer> <C-m> :!minizinc % -s --solver chuffed<CR>
 autocmd BufNewFile,BufRead *.mzn nnoremap <buffer> <C-n> :!minizinc % -a -s --solver chuffed<CR>
augroup end

" outline
augroup V_Outline
 autocmd!
 autocmd BufWritePost *.outline :!outmind %
 setlocal softtabstop=1
 setlocal shiftwidth=1
 setlocal foldmethod=indent
 setlocal fileformat=unix
augroup end

" Prevent background
noremap <C-z> <NOP>

" Disable Ex mode (don't need it)
nnoremap Q :q!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set showmatch

" searches with a capital are case sensitive
set smartcase
" searches with no capitals are case insensitive
set ignorecase

" Always use very magic mode for searching
nnoremap / /\v
nnoremap ? ?\v
cnoremap s/ s/\v
cnoremap %s/ %s/\v

" Clear search
nnoremap <leader>l :nohlsearch<CR>

" Visual search
vnoremap / y/<C-r>"<CR>

" Ack for word under cursor
nnoremap <leader>A yiw:Ack <C-r>"<CR>
nnoremap <leader>C :cclose<CR>

" Google search for word under cursor
nnoremap <leader>q :exec "!google-chrome 'http://www.google.com/search\?q\=" . expand("<cword>") . "'"<CR>

" Add comma
nnoremap <leader>, mmA,<ESC>`m
nnoremap <leader>; mmA;<ESC>`m

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONTROL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Join
nnoremap <C-j> J

" Quickfix
nnoremap <C-e> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap <C-q> :cclose<CR>

" Navigate jump list
nnoremap <C-h> <C-o>
nnoremap <C-l> <C-i>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" when file was opened without appropriate privileges
cnoremap w!! w !sudo tee % > /dev/null

" more intuitive binding (matches my command line mapping)
cnoremap <C-e> <C-f>
cnoremap <C-f> <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOTION MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move to beginning/end of line
nnoremap H _
nnoremap L $
nnoremap 0 <NOP>
nnoremap _ <NOP>
nnoremap $ %

vnoremap H _
vnoremap L $
vnoremap 0 <NOP>
vnoremap _ <NOP>
vnoremap $ <NOP>

nnoremap J }
nnoremap K {

vnoremap J }
vnoremap K {

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NORMAL MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always paste last yank
nnoremap ) "0P
nnoremap 0 "0p
vnoremap ) "0P
vnoremap 0 "0p

" Yank 'til end of line
nnoremap Y y$

" Visual 'til end of line
nnoremap vv V
nnoremap V v$

" I never use this
nnoremap S <nop>

" Move by visual lines
nnoremap k gk
nnoremap j gj

" Add numbered movements to jump list
nnoremap <expr> k (v:count > 1 ? "m'" . v:count . 'k' : 'gk')
nnoremap <expr> j (v:count > 1 ? "m'" . v:count . 'j' : 'gj')
nnoremap gj j
nnoremap gk k

" Recall last command or search
nnoremap ; :
nnoremap : :<Up>
nnoremap ? /<Up>

" Select last pasted text
noremap gp `[v`]

" Prevent replace mode
nnoremap R <NOP>

" Sane matching
" Can't use nnoremap, otherwise won't work with matchit Plugin
nmap <TAB> %

" Comment (<C-/>)
nmap <C-_> gcc
vmap <C-_> gc

" Rename symbol
nnoremap <C-r> "wyiw:%s/<C-R>w//gc<left><left><left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Escape
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>
inoremap jK <ESC>
inoremap <ESC> <c-o><ESC>
inoremap <C-[> <c-o><ESC>

" Quick insert last yank/delete
inoremap <C-r><C-r> <C-r>"

" Jump to start/end of line
inoremap <C-h> <C-o>_
inoremap <C-l> <C-o>$

" Delete 'til end of line
inoremap <C-d> <C-o>d$
inoremap <C-c> <C-o>d$

" Jump to next line
inoremap <C-o> <ESC>o

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

" augroup V_DeleteWhitespaceOnSave
"   autocmd!
"   autocmd BufWritePre * :call <SID>StripTrailingWhitespace()
" augroup end

" Disable the mouse
" THIS DOESN'T ACTUALLY WORK MAYBE TRY RECOMPILING WITHOUT MOUSE?
set mouse=
set ttymouse=

" Keep cursor centered on screen
augroup V_CenterCursor
 autocmd!
 autocmd BufEnter,WinEnter,WinNew,VimResized *,*.*
    \ let &scrolloff=winheight(win_getid())/2
augroup end

" Return to last edit position when opening files (You want this!)
augroup V_ReopenAtLastEdit
 autocmd!
 autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\" "|
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
inoremap <C-f>à <C-o>dFà<C-o>x
inoremap <C-f>b <C-o>dFb<C-o>x
inoremap <C-f>c <C-o>dFc<C-o>x
inoremap <C-f>d <C-o>dFd<C-o>x
inoremap <C-f>e <C-o>dFe<C-o>x
inoremap <C-f>é <C-o>dFé<C-o>x
inoremap <C-f>è <C-o>dFè<C-o>x
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
