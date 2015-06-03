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

"End vundle
call vundle#end()

" Now we can turn our filetype functionality back on
filetype plugin indent on

set number
syntax on

autocmd vimenter * NERDTree
