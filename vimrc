set nocompatible              " be iMproved, required
filetype off                  " required

" --- vundle settings
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" basic plugin
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
" depend on perl ack script
" e.g. brew install ack
"Plugin 'mileszs/ack.vim'

" appearance plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" --- basic settings
let mapleader = ','
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

set foldenable

" --- airline & statusline settings
if has('statusline')
	set laststatus=2
endif

" For ubuntu workaround
"let g:solarized_termcolors=256
"set t_Co=256
"set background=dark
"let g:airline_theme = "cool"
let g:airline_powerline_fonts = 1
if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
   if !exists('g:airline_theme')
       let g:airline_theme = 'solarized'
   endif
   if !exists('g:airline_powerline_fonts')
       " Use the default set of separators with a few customizations
       let g:airline_left_sep='›'  " Slightly fancier than '>'
       let g:airline_right_sep='‹' " Slightly fancier than '<'
   endif
endif

" --- color scheme
if isdirectory(expand("~/.vim/bundle/vim-colors-solarized"))
	colorscheme solarized
endif

" -- nerdtree,ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>e :NERDTreeToggle<CR>

" shortcut
"nnoremap <leader>f :vimgrep<space>
"nnoremap <leader>f :vimgrep // %<left><left><left>
nnoremap <leader>f :vimgrep // %\|cw<left><left><left><left><left><left>
"nnoremap <leader>f :vimgrep // %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
