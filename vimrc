" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
" thanks to:
"  . vimrc  : https://github.com/spf13/spf13-vim
"  . vimrc  : https://github.com/square/maximum-awesome/blob/master/vim/plugin/whitespace/whitespace.vim
"  . python : https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

set nocompatible              " be iMproved, required

" Windows compatible {
" Stolen from spf13-vim
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    " Be nice and check for multi_byte even if the config requires
    " multi_byte support most of the time
    if has("multi_byte")
        " Windows cmd.exe still uses cp850. If Windows ever moved to
        " Powershell as the primary terminal, this would be utf-8
        if has("gui_running")
            set termencoding=utf-8
        else
            set termencoding=cp936
        endif

        " Let Vim use utf-8 internally, because many scripts require this
        set encoding=utf-8
        setglobal fileencoding=utf-8
        " Windows has traditionally used cp1252, so it's probably wise to
        " fallback into cp1252 instead of eg. iso-8859-15.
        " Newer Windows files might contain utf-8 or utf-16 LE so we might
        " want to try them first.
        set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15

        " menu messy code
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim

        " vim prompt messy code
        language messages en_US.utf-8
    endif

    " remove the gui menus
    set guioptions-=T
    set guioptions-=m
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
    set guioptions-=e

    " conemu
    set termencoding=utf-8
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
endif
" }

" Load the user custom settings {
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }

" Vundle {
" inspired by spf13-vim
" override this by setting 'let g:bundle_groups' in .vimrc.local
if !exists('g:bundle_groups')
    let g:bundle_groups=['appearance',]
endif

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" put the most productive plugin here (except vundle)
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

if count(g:bundle_groups, 'appearance')
    Plugin 'vim-airline/vim-airline'
    Plugin 'altercation/vim-colors-solarized'
endif

if count(g:bundle_groups, 'ycm')
    Plugin 'Valloric/YouCompleteMe'
endif

if count(g:bundle_groups, 'python')
    Plugin 'nvie/vim-flake8'
    Plugin 'tmhedberg/SimpylFold'
endif

if count(g:bundle_groups, 'go')
    Plugin 'fatih/vim-go'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }

" General {
"
let mapleader = "\<Space>"
set nu
syntax on
set hidden
set smartindent
set autoindent
set encoding=utf-8
set textwidth=79
set incsearch
set hlsearch
set ignorecase
set history=1000
set spell
if has('statusline')
    set laststatus=2
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
" }

" Formatting: Tab, Spaces, Fold {
set list

if has('win32') || has('win64')
    set listchars=tab:>-,trail:.
else
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
endif

" default settings
set foldenable
set foldlevel=99
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set foldmethod=indent
set backspace=indent,eol,start

" special settings
if has("autocmd")
    autocmd FileType cpp setlocal ts=2 sts=2 sw=2 et fdm=syntax
    autocmd FileType python setlocal ts=4 sts=4 sw=4 et fdm=indent
    autocmd FileType go setlocal ts=8 sts=8 sw=8 noet fdm=syntax
endif
" }

" Plugin settings {
" CtrlP {
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <silent> <c-b> :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
" }

" NerdTree {
nnoremap <leader>e :NERDTreeToggle<CR>
" }

" YouCompleteMe {
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/ycm_extra_conf.py'
"set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
"highlight YcmWarningSection ctermbg=none
highlight YcmWarningSign guibg=#FFFF66
" }

" (optional) airline {
if isdirectory(expand("~/.vim/bundle/vim-airline"))
    let g:airline#extensions#tabline#enabled = 1
    if has("gui_running") || (!has('win32') && !has('win64'))
        set guifont=Sauce_Code_Powerline:h10:cANSI
    endif
    let g:airline_powerline_fonts = 1
endif
" }

" (optional) vim-colors-solarize {
if isdirectory(expand("~/.vim/bundle/vim-colors-solarized"))
    colorscheme solarized
    " For ubuntu workaround
    if has("unix")
       let s:uname = system("uname -v")
       let s:tmp = matchstr(s:uname, '^.*Ubuntu.*$')
       if strlen(s:tmp) != 0
          let g:solarized_termcolors=256
          set t_Co=256
          set background=dark
       endif
    endif
    if has('win32') || has('win64')
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"

        " rollback to origin since windows cmd not support solarized
        if !has('gui_running')
            colorscheme default
        endif
    endif
endif
"}

" (optional) SimplyIFold {
if isdirectory(expand("~/.vim/bundle/SimpylFold"))
    autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
    autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
endif
" }

" (optional) vim-go {
if isdirectory(expand("~/.vim/bundle/vim-go"))
    let g:go_fmt_autosave = 0
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_types = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"
    au FileType go nmap <Leader>gi <Plug>(go-implements)
    au FileType go nmap <Leader>ge <Plug>(go-rename)
    au FileType go nmap <leader>gr <Plug>(go-run)
    au FileType go nmap <leader>gb <Plug>(go-build)
endif
" }

" }

" Awesome shortcut {

" search {
nnoremap <leader>f :vimgrep // %\|cw<left><left><left><left><left><left>
" }

" buffer {
nnoremap <Leader>n :bnext<CR>
" }

" formatting {
"nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader><space> :call StripTrailingWhitespace()<CR>
" }

" clang-format {
if exists('g:clang_format_py_path')
    execute "map <C-K> :py3f " . g:clang_format_py_path . "<cr>"
    execute "imap <C-K> <c-o>:py3f " . g:clang_format_py_path . "<cr>"
    execute "map <C-N> ggVG :py3f " . g:clang_format_py_path . "<cr>"
endif
" }

" }

" Functions {
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

if !exists('g:no_restore_cursor')
    function! ResCur()
        if line("'\"") <= line("$")
            silent! normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END
endif

" }

"let g:airline_symbols = {}
"let g:airline_left_sep = "\u2b80" "use double quotes here
"let g:airline_left_alt_sep = "\u2b81"
"let g:airline_right_sep = "\u2b82"
"let g:airline_right_alt_sep = "\u2b83"
"let g:airline_symbols.branch = "\u2b60"
"let g:airline_symbols.readonly = "\u2b64"
"let g:airline_symbols.linenr = "\u2b61"

"let g:solarized_termcolors=256


