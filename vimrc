" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
" thanks to:
"  . vimrc  : https://github.com/spf13/spf13-vim
"  . vimrc  : https://github.com/square/maximum-awesome/blob/master/vim/plugin/whitespace/whitespace.vim
"  . python : https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

set nocompatible              " be iMproved, required

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

if count(g:bundle_groups, 'cpp')
    Plugin 'rhysd/vim-clang-format'
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
"set listchars=tab:>-,trail:.
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

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
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }

" (optional) airline {
if isdirectory(expand("~/.vim/bundle/vim-airline"))
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
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
endif
"}

" (optional) vim-clang-format {
if isdirectory(expand("~/.vim/bundle/vim-clang-format"))
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
endif
" }

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

" }
