set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'blueshirts/darcula'
Plugin 'scrooloose/syntastic'
Plugin 'wookiehangover/jshint.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"colors
set t_Co=256
syntax on
set background=dark
colorscheme darcula

"tabs
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2
"line numbers
set number

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
