set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
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

"End vundle
call vundle#end()

" Now we can turn our filetype functionality back on
filetype plugin indent on

set number
syntax on

autocmd vimenter * NERDTree
" Mah keys
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

