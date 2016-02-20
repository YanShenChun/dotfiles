set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nu
syntax on
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smartindent shiftwidth=4

set list
set listchars=tab:>-,trail:.

if has('statusline')
   set laststatus=2
   " Broken down into easily includeable segments
   "set statusline=%<%f\                     " Filename
   "set statusline+=%w%h%m%r                 " Options
   "set statusline+=%{fugitive#statusline()} " Git Hotness
   "set statusline+=\ [%{&ff}/%Y]            " Filetype
   "set statusline+=\ [%{getcwd()}]          " Current dir
   "set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" if isdirectory(expand("~/.vim/bundle/vim-airline/"))
"     if !exists('g:airline_theme')
"         let g:airline_theme = 'solarized'
"     endif
"     if !exists('g:airline_power_fonts')
"         " use the default set of separators with a few customizations
"         let g:airline_left_sep='›'  " Slightly fancier than '>'
"         let g:airline_right_sep='‹' " Slightly fancier than '<'
"     endif
" endif

" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" syntax enable
" set background=dark
" set t_Co=16
" colorscheme solarized

let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

"let g:airline_theme = "luna"
let g:airline_theme = "cool"
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

"if !exists('g:airline_symbols')
"	let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"
"let g:Powerline_symbols='fancy'
"let g:airline_powerline_fonts=1
"let Powerline_symbols='fancy'
