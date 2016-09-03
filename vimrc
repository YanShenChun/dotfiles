" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }

" General {
let mapleader = ','
set nu
syntax on
set smartindent
set foldenable
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

" Tab and Spaces {
set list
set listchars=tab:>-,trail:.

" default settings
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4

" special settings
if has("autocmd")
    autocmd FileType cpp setlocal ts=2 sts=2 sw=2 et
endif
" }

" Plugin settings {
" CtrlP {
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <silent> <c-b> :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
" }

" NerdTree {
nnoremap <leader>e :NERDTreeToggle<CR>
" }

" YouCompleteMe {
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set completeopt-=preview
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }

" (optional) airline {
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
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
" }

" Search {
nnoremap <leader>f :vimgrep // %\|cw<left><left><left><left><left><left>
" }

