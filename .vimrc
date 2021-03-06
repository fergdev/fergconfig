""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FergDev vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lets get some plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/syntastic'
    Plugin 'pangloss/vim-javascript'
    Plugin 'elzr/vim-json'
    Plugin 'mbbill/undotree'                     " Undo visualiser
    Plugin 'godlygeek/tabular'                   " Aligns text
    Plugin 'ctrlp.vim'                           " Full path fuzzy file, buffer, mru, ta, .... finder for vim
    Plugin 'fergdev/vim-umajin-syntax'           " Syntax highlighting for .u
    Plugin 'dkprice/vim-easygrep'                " Allow for greping in files
    Plugin 'mileszs/ack.vim'                     " Try using ack for searching
    Plugin 'majutsushi/tagbar'                   " Displaying mah tags
    Plugin 'scrooloose/nerdcommenter'            " Orgasmic commenting
    Plugin 'michaeljsmith/vim-indent-object.git' " Indent Object
    Plugin 'inside/vim-grep-operator'            " Grep text objects
    Plugin 'fergdev/NAPaLM'                      " Auto printlns boooooooom
    Plugin 'vim-airline/vim-airline'             " Tab-line
    Plugin 'vim-airline/vim-airline-themes'      " Some arline themes
    Plugin 'kristijanhusak/vim-hybrid-material'  " Color scheme
    Plugin 'Raimondi/delimitMate'                " Matching delims
    Plugin 'jez/vim-superman'                    " Man vim

call vundle#end()

" Now we can turn our filetype functionality back on
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" History
set history=1000    " remember more commands and search history
set undolevels=1000 " more undo
set nobackup        " dont need backups
set noswapfile      " stop the annoy file appearing

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
set background=dark
colorscheme hybrid_material
let g:airline_theme = "hybrid"
syntax on             " syntax highligting
filetype on
filetype indent on
set ai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and spaces
set tabstop=4     " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set expandtab     " tabs are spaces
set shiftwidth=4
nnoremap <Leader>l=set list!<CR>
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI config
set showcmd             " Show partial commands down below
set cursorline          " highlight currentline
set wildmenu            " visual autocomplete for command menu
set number              " line numbers
set ruler               " show the current row and column
set relativenumber      " show numbers relative to where I am
set noeb vb t_vb=       " No bells plz
set backspace=indent,eol,start  " make that backspace key work the way it should
set scrolloff=10         " keep 3 lines when scrolling
set showmode            " Show the current mode
" Set a helpful status bar
set laststatus=2        " always a status line
set complete=.,w,b,t   " Order to search for completion

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
set hlsearch   " highlight matches
set incsearch  " search as characters are entered
set showmatch  " highlight matching [{()}]
set ignorecase " ignore case when searching
set smartcase  " no ignorecase if Uppercase is on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
let mapleader=" "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_max_files=0          " Set no max file limit
let g:ctrlp_working_path_mode=0  " Search from current directory instead of project root

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular
vnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t' :Tabularize /'<CR>
vnoremap <Leader>t` :Tabularize /`<CR>
vnoremap <Leader>t+ :Tabularize /+<CR>
vnoremap <Leader>t+ :Tabularize /+<CR>
vnoremap <Leader>t, :Tabularize /,<CR>
vnoremap <Leader>t: :Tabularize /:<CR>
vnoremap <Leader>t; :Tabularize /;<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout       = 3
let g:undotree_SetFocusWhenToggle = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inside vim-grep-operator
set grepprg=grep\ -rn\ $*\ .
"let g:grep_operator = 'Ag'
"let g:grep_operator = 'Ack'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mah keys
"

imap <C-c> <CR><Esc>O                   " Does a line split plus new line 

map <silent> <PageUp> 1000<C-U>         " This code forces page up/down
map <silent> <PageDown> 1000<C-D>       " to maintain the cursor position
imap <silent> <PageUp> <C-O>1000<C-U>   " in the x and the y of the document
imap <silent> <PageDown> <C-O>1000<C-D> " ..... very nice
set nostartofline

nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-h> :wincmd h<CR>

" Does grep search for term
nnoremap gr :execute "vimgrep /" . expand("<cword>") . "/gj **/*." . expand("%:e")<Bar> cw<CR>
nnoremap gR :execute "vimgrep /\<" . expand("<cword>") . "\>/gj **/*." . expand("%:e")<Bar> cw<CR>
nnoremap Gr :execute "vimgrep /" . expand("<cWORD>") . "/gj **/*." . expand("%:e")<Bar> cw<CR>
nnoremap GR :execute "vimgrep /\<" . expand("<cWORD>") . "\>/gj **/*." . expand("%:e")<Bar> cw<CR>

nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt

" Turn of silly keys that are too far away
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>
nnoremap <Del> <NOP>
nnoremap <Insert> <NOP>
nnoremap <Home> <NOP>
nnoremap <End> <NOP>

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

nnoremap <S-Up> <NOP>
nnoremap <S-Down> <NOP>
nnoremap <S-Left> <NOP>
nnoremap <S-Right> <NOP>
vnoremap <S-Up> <NOP>
vnoremap <S-Down> <NOP>
vnoremap <S-Left> <NOP>
vnoremap <S-Right> <NOP>
inoremap <S-Up> <NOP>
inoremap <S-Down> <NOP>
inoremap <S-Left> <NOP>
inoremap <S-Right> <NOP>

nnoremap <C-Up> <NOP>
nnoremap <C-Down> <NOP>
nnoremap <C-Left> <NOP>
nnoremap <C-Right> <NOP>
vnoremap <C-Up> <NOP>
vnoremap <C-Down> <NOP>
vnoremap <C-Left> <NOP>
vnoremap <C-Right> <NOP>
inoremap <C-Up> <NOP>
inoremap <C-Down> <NOP>
inoremap <C-Left> <NOP>
inoremap <C-Right> <NOP>

nnoremap <A-Up> <NOP>
nnoremap <A-Down> <NOP>
nnoremap <A-Left> <NOP>
nnoremap <A-Right> <NOP>
vnoremap <A-Up> <NOP>
vnoremap <A-Down> <NOP>
vnoremap <A-Left> <NOP>
vnoremap <A-Right> <NOP>
inoremap <A-Up> <NOP>
inoremap <A-Down> <NOP>
inoremap <A-Left> <NOP>
inoremap <A-Right> <NOP>

nnoremap <F1> <NOP>
nnoremap <F2> <NOP>
nnoremap <F3> <NOP>
nnoremap <F4> <NOP>
nnoremap <F5> <NOP>
nnoremap <F6> <NOP>
nnoremap <F7> <NOP>
nnoremap <F8> <NOP>
nnoremap <F9> <NOP>
nnoremap <F10> <NOP>
nnoremap <F11> <NOP>
nnoremap <F10> <NOP>

inoremap <F1> <NOP>
inoremap <F2> <NOP>
inoremap <F3> <NOP>
inoremap <F4> <NOP>
inoremap <F5> <NOP>
inoremap <F6> <NOP>
inoremap <F7> <NOP>
inoremap <F8> <NOP>
inoremap <F9> <NOP>
inoremap <F10> <NOP>
inoremap <F11> <NOP>
inoremap <F10> <NOP>

vnoremap <F1> <NOP>
vnoremap <F2> <NOP>
vnoremap <F3> <NOP>
vnoremap <F4> <NOP>
vnoremap <F5> <NOP>
vnoremap <F6> <NOP>
vnoremap <F7> <NOP>
vnoremap <F8> <NOP>
vnoremap <F9> <NOP>
vnoremap <F10> <NOP>
vnoremap <F11> <NOP>
vnoremap <F10> <NOP>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autogroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.u setlocal formatprg=par\ -w80\ -T4
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom tagbar stuff
let g:tagbar_type_umajin = {
    \ 'ctagstype' : 'umajin',
    \ 'kinds' : [
            \'d:Define',
            \'i:Instance',
            \'m:Method',
            \'p:Property',
    \]
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commenting stuff
let g:NERDCustomDelimiters = {
    \'umajin' : { 'left' : '/*', 'right':'*/', 'leftAlt':'//'}
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NAPaLM custom langdefs
let g:NAPaLMCustomLanguageDefs = {
    \  'umajin' : {'sps' : 'println("\n${name}")',
    \              'vps' : 'println("${name} = " + ${var}.name + " , " + ${var}.typeof())',
    \              'ops' :
    \              {
    \                'int'    : 'println("${name} = " + ${var})',
    \                'string' : 'println("${name} = " + ${var})',
    \                'real'   : 'println("${name} = " + ${var})',
    \                'bool'   : 'println("${name} = " + ${var})'
    \              },
    \              'comment' : '//'}
    \}
