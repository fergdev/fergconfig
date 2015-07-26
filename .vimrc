""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FergDev vimrc

""" Lets get some plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic'
Plugin 'Buffergator'
Plugin 'myusuf3/numbers.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'elzr/vim-json'
Plugin 'bling/vim-airline'               " Status bar
Plugin 'mbbill/undotree'                 " Undo visualiser
Plugin 'ervandew/supertab'               " Code Completion
Plugin 'nathanaelkane/vim-indent-guides' " Indent helper
Plugin 'godlygeek/tabular'               " Aligns text
Plugin 'ctrlp.vim'                       " Full path fuzzy file, buffer, mru, ta, .... finder for vim
Plugin 'fergdev/vim-umajin-syntax'       " Syntax highlighting for .u
Plugin 'dkprice/vim-easygrep'            " Allow for greping in files
Plugin 'fergdev/vim-cursor-hist'         " Mah cursor hist
Plugin 'mileszs/ack.vim'                 " Try using ack for searching
Plugin 'majutsushi/tagbar'               " Displaying mah tags
call vundle#end()

" Now we can turn our filetype functionality back on
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"History
set history=1000    " remember more commands and search history
set undolevels=1000 " more undo
set nobackup        " dont need backups
set noswapfile      " stop the annoy file appearing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
set background=light  " light bg
colorscheme solarized " colorscheme
syntax on             " syntax highligting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and spaces

set tabstop=4     " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set expandtab     " tabs are spaces
nnoremap <Leader>l=set list!<CR>
set listchars=tab:▸\ ,eol:¬
"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI config
set cursorline          " highlight currentline
set wildmenu            " visual autocomplete for command menu
set number              " line numbers
set showmatch           " highlight matching [{()}]
set virtualedit=onemore " allows me to go to end of line
set noeb vb t_vb=
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
set hlsearch 		" highlight matches
set incsearch		" search as characters are entered

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"set foldenable        " enable folding
"set foldlevelstart=10 " open most folds by default
"set foldnestmax=10    " 10 nested fold max
"set foldmethod=indent " fold based on indent level
"nnoremap <space> za   " space open/closes folds

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
nnoremap j gj
nnoremap k gk

map <silent> <PageUp> 1000<C-U>         " This code forces page up/down
map <silent> <PageDown> 1000<C-D>       " to maintain the cursor position
imap <silent> <PageUp> <C-O>1000<C-U>   " in the x and the y of the document
imap <silent> <PageDown> <C-O>1000<C-D> " ..... very nice
set nostartofline
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
    vmap <Leader>t" :Tabularize /"<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree

autocmd vimenter * NERDTree	" start with nerd tree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree                   

nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout       = 3
let g:undotree_SetFocusWhenToggle = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mah keys

map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F`$i3

nnoremap <F4> :NumbersToggle<CR>
nnoremap <F5> :NumbersOnOff<CR>
nnoremap <F6> :set paste<CR>
nnoremap <F7> :set nopaste<CR>
nnoremap $ g$
nnoremap <S-j> :bnext<CR>
nnoremap <S-k> :bprevious<CR>

inoremap <ESC> <NOP>

nmap <Leader>s :source $MYVIMRC<CR>
nmap <Leader>v :e $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golden Window
" 1. split to tiled windows
nmap <silent> <C-L> <Plug>GoldenViewSplit<CR>

" 2. quickly switch current window with the main pane
" and toggle back
nmap <F8> <Plug>GoldenViewSwitchMain<CR>
nmap <F9> <Plug>GoldenViewSwitchToggle<CR>

" 3. jump to next and previous window
nmap <silent> <C-j> <Plug>GoldenViewNext<CR>
nmap <silent> <C-k> <Plug>GoldenViewPrevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autogroups

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
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
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom functions

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! DelEmptyLineAbove()
    if line(".") == 1
        return
    endif
    let l:line = getline(line(".") - 1)
    if l:line =~ '^s*$'
        let l:colsave = col(".")
        .-1d
        silent normal! <C-y>
        call cursor(line("."), l:colsave)
    endif
endfunction

function! AddEmptyLineAbove()
    let l:scrolloffsave = &scrolloff
    " Avoid jerky scrolling with ^E at top of window
    set scrolloff=0
    call append(line(".") - 1, "")
    if winline() != winheight(0)
        silent normal! <C-e>
    endif
    let &scrolloff = l:scrolloffsave
endfunction

function! DelEmptyLineBelow()
    if line(".") == line("$")
        return
    endif
    let l:line = getline(line(".") + 1)
    if l:line =~ '^s*$'
        let l:colsave = col(".")
        .+1d
        ''
        call cursor(line("."), l:colsave)
    endif
endfunction

function! AddEmptyLineBelow()
    call append(line("."), "")
endfunction

" Arrow key remapping: Up/Dn = move line up/dn; Left/Right = indent/unindent
function! SetArrowKeysAsTextShifters()
    " normal mode
    nmap <silent> <Left> <<
    nmap <silent> <Right> >>
    nnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>
    nnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>
    nnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>
    nnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>

    " visual mode
    vmap <silent> <Left> <
    vmap <silent> <Right> >
    vnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>gv
    vnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>gv
    vnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>gv
    vnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>gv

    " insert mode
    imap <silent> <Left> <C-D>
    imap <silent> <Right> <C-T>

    inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>a
    inoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>a
    inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>a
    inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>a

    " disable modified versions we are not using
    nnoremap  <S-Up>     <NOP>
    nnoremap  <S-Down>   <NOP>
    nnoremap  <S-Left>   <NOP>
    nnoremap  <S-Right>  <NOP>
    vnoremap  <S-Up>     <NOP>
    vnoremap  <S-Down>   <NOP>
    vnoremap  <S-Left>   <NOP>
    vnoremap  <S-Right>  <NOP>
    inoremap  <S-Up>     <NOP>
    inoremap  <S-Down>   <NOP>
    inoremap  <S-Left>   <NOP>
    inoremap  <S-Right>  <NOP>
endfunction

call SetArrowKeysAsTextShifters()

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
"call HardMode()  " Lets go hard mode
"
let g:tagbar_type_umajin = {
    \ 'ctagstype' : 'umajin',
    \ 'kinds' : [
            \'d:Define',
            \'i:Instance',
            \'m:Method',
            \'p:Property',
    \]
\}


