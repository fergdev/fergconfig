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
    Plugin 'altercation/vim-colors-solarized'    " Colorscheme
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
set background=light  " light bg
colorscheme solarized " colorscheme
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
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
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
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_max_files=0          " Set no max file limit
let g:ctrlp_working_path_mode=0  " Search from current directory instead of project root

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular
if exists(":Tabularize")
    nmap <Leader>t= :Tabularize /=<CR>
    vmap <Leader>t= :Tabularize /=<CR>
    nmap <Leader>t" :Tabularize /"<CR>
    nmap <Leader>t" :Tabularize /"<CR>
    nmap <Leader>t' :Tabularize /'<CR>
    vmap <Leader>t' :Tabularize /'<CR>
    nmap <Leader>t` :Tabularize /`<CR>
    vmap <Leader>t` :Tabularize /`<CR>
    vmap <Leader>t+ :Tabularize /+<CR>
    vmap <Leader>t+ :Tabularize /+<CR>
    nmap <Leader>t, :Tabularize /,<CR>
    vmap <Leader>t, :Tabularize /,<CR>
    nmap <Leader>t: :Tabularize /:<CR>
    vmap <Leader>t: :Tabularize /:<CR>
    nmap <Leader>t; :Tabularize /;<CR>
    vmap <Leader>t; :Tabularize /;<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree                   
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout       = 3
let g:undotree_SetFocusWhenToggle = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inside vim-grep-operator
set grepprg=grep\ -rn\ $*\ . 
"let g:grep_operator = 'Ag'
"let g:grep_operator = 'Ack'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mah keys

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

" Make <C-c> act the same as escape
inoremap <C-c> <Esc>    
nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Turn of silly keys that are too far away
inoremap <ESC> <NOP>
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
" Custom functions
" Toggle hard mode
let g:HardModeOn=1
let g:HardMode_message="Stop being NOOOOOOOOOOOOOB"
function! HardModeEcho(message)
    echo a:message
endfunction

function! ToggleHardMode()
        if g:HardModeOn==1
            call EasyMode()
        else
            call HardMode()
        endif
endfunction

function! HardMode()
    let g:HardModeOn=1
    vnoremap <buffer> h <Esc>:call HardModeEcho(g:HardMode_message)<CR>

    vnoremap <buffer> j <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    vnoremap <buffer> k <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    vnoremap <buffer> l <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    vnoremap <buffer> - <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    vnoremap <buffer> + <Esc>:call HardModeEcho(g:HardMode_message)<CR>

    " Display line motions
    vnoremap <buffer> gj <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    vnoremap <buffer> gk <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    nnoremap <buffer> gk <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    nnoremap <buffer> gj <Esc>:call HardModeEcho(g:HardMode_message)<CR>

    nnoremap <buffer> h <Esc>:call HardModeEcho(g:HardMode_message)<CR>

    nnoremap <buffer> j <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    nnoremap <buffer> k <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    nnoremap <buffer> l <Esc>:call HardModeEcho(g:HardMode_message)<CR>
    nnoremap <buffer> - <Esc>:call HardModeEcho(g:HardMode_message)<CR>
endfunction

function! EasyMode()
    let g:HardModeOn=0
    silent ! vunmap <buffer> h
    silent ! vunmap <buffer> j
    silent ! vunmap <buffer> k
    silent ! vunmap <buffer> l
    silent ! vunmap <buffer> -
    silent ! vunmap <buffer> +

    silent ! nunmap <buffer> h
    silent ! nunmap <buffer> j
    silent ! nunmap <buffer> k
    silent ! nunmap <buffer> l
    silent ! nunmap <buffer> -
    silent ! nunmap <buffer> +
endfunction
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
" My printing functions - I never want to have to type a println ever again
let g:QPrintToken = 'QQQPrintTokenQQQ'

function! QPrintArgs()
    echom 'QPrintArgs'

    " Get line and number
    let currLineNumber = line('.') 
    let currLine = getline('.')
    if currLine == ''
        return
    end

    " Extract method name
    let methodName = matchstr(currLine, '\vmethod\s+\zs\w+\ze\(') 
    if methodName == ''
        return
    end

    call append(currLineNumber ,'println("\n' . methodName . '")//'.g:QPrintToken )
    let currLineNumber += 1

    " Extract args
    let argsStr = matchstr(currLine, '\v\(\zs.*\ze\)' )
    let argsSplit = split(argsStr, ',')
    let i = 0
    let splitLen = len(argsSplit)
    while i < splitLen
        "let arg = argsSplit[i]
        "echom 'SP ' . arg
        let arg = matchstr(argsSplit[i], '\v\s*\w+\s+\zs\w+\ze') 
        "echom 'SP ' . arg
        call append(currLineNumber, 'println("'.arg.' = "+'.arg.')//'.g:QPrintToken )
        let currLineNumber += 1
        let i += 1
    endwhile
endfunction
function! QPrintVar()

    " Get the current line and the line number
    let currLineNumber = line('.') 
    let currLine = getline('.')
    if currLine == ''
        return
    end
    " Extract method name
    let varName = matchstr(currLine, '\v\zs\w+\ze\s*\=') 
    if varName == '' 
        return
    end

    " Add print statement
    call append(currLineNumber ,'println("' . varName . ' = "+'.varName.')//'.g:QPrintToken )
endfunction
function! QPrintComment()
   execute 's/\v.*'.g:QPrintToken.'/\/\/&'
endfunction
function! QPrintUnComment()
    execute 's/\v/\/\\zs.*'.g:QPrintToken.'$/&'
endfunction 
function! QPrintDelete()
   execute 'g/\v'.g:QPrintToken.'/d'
endfunction
nnoremap <silent> <Leader>pa :call QPrintArgs()<CR>      " Print args
nnoremap <silent> <Leader>pv :call QPrintVar()<CR>       " Print var
nnoremap <silent> <Leader>pc :call QPrintComment()<CR>   " Comment out print statements
nnoremap <silent> <Leader>pC :call QPrintUnComment()<CR> " UnComment out print statements
nnoremap <silent> <Leader>pd :call QPrintDelete()<CR>    " Delete all print statements
