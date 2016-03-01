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
Plugin 'ianva/vim-youdao-translater'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" --- basic settings
set nu
syntax on
set softtabstop=2
set shiftwidth=2
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set list
set listchars=tab:>-,trail:.

let mapleader = ','

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

" --- clang_complete
let g:clang_complete_copen = 1
let g:clang_use_library = 1
let g:clang_library_path = '/usr/lib/llvm-3.5/lib/'
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1

" --- youdao_translate
vnoremap <silent> <C-T> <Esc>:Ydv<CR> 
nnoremap <silent> <C-T> <Esc>:Ydc<CR> 
noremap <leader>yd :Yde<CR>

" -- syntastic
" -- TODO: need to add the custom config 
let g:syntastic_cpp_include_dirs=['/opt/opencv-2.4.9/include']

" -- neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
