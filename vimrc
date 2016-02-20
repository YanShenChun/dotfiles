set nocompatible              " be iMproved, required
filetype off                  " required

" --- vundle settings
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Rip-Rip/clang_complete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" --- basic settings
set nu
syntax on
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set smartindent

set list
set listchars=tab:>-,trail:.

" --- airline & statusline settings
if has('statusline')
	set laststatus=2
endif

let g:solarized_termcolors=256
set t_Co=256
set background=dark
let g:airline_theme = "cool"
let g:airline_powerline_fonts = 1

" --- color scheme
if isdirectory(expand("~/.vim/bundle/vim-colors-solarized"))
	colorscheme solarized
endif


let g:clang_complete_copen = 1
let g:clang_use_library = 1
let g:clang_library_path = '/usr/lib/llvm-3.5/lib/'
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
