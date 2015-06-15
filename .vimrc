set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()


" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format

Plugin 'gmarik/vundle'
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

"End vundle
call vundle#end()

" Now we can turn our filetype functionality back on
filetype plugin indent on

set number
syntax on
set background=light
colorscheme solarized

autocmd vimenter * NERDTree

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

"nnoremap <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <Leader>- :exe "resize " . (winheight(0) * 3/2)<CR>

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




