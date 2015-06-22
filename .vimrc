""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FergDev bashrc

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
Plugin 'bling/vim-airline'                  " status bar
Plugin 'mbbill/undotree'                    " undo visualiser

call vundle#end()
" Now we can turn our filetype functionality back on
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors 
set background=light 	" light bg
colorscheme solarized 	" colorscheme

syntax on 		" syntax highligting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and spaces 

set tabstop=4 		" number of visual spaces per tab
set softtabstop=4 	" number of spaces in tab when editing
set expandtab 		" tabs are spaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI config 
set cursorline 		" highlight currentline
set wildmenu		" visual autocomplete for command menu
set number 		" line numbers
set showmatch 		" highlight matching [{()}]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
set hlsearch 		" highlight matches
set incsearch		" search as characters are entered

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
set foldenable		" enable folding
set foldlevelstart=10	" open most folds by default
set foldnestmax=10	" 10 nested fold max
set foldmethod=indent 	" fold based on indent level
set nnoremap <space> za	" space open/closes folds

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
nnoremap j gj
nnoremap k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree 

autocmd vimenter * NERDTree	" start with nerd tree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree

<leader>u :UndotreeToggle<CR> 

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

noremap <F4> :NumbersToggle<CR>
nnoremap <F5> :NumbersOnOff<CR>
nnoremap <F6> :set paste<CR>
nnoremap <F7> :set nopaste<CR>

nnoremap <S-N> :bnext<CR>
nnoremap <S-P> :bprevious<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golden Window
" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <F8> <Plug>GoldenViewSwitchMain
nmap <F9> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <silent> <C-N>  <Plug>GoldenViewNext
nmap <silent> <C-P>  <Plug>GoldenViewPrevious

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

