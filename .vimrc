﻿"   ┏┳┓╻ ╻   ╻ ╻╻┏┳┓┏━┓┏━╸
"   ┃┃┃┗┳┛   ┃┏┛┃┃┃┃┣┳┛┃
"   ╹ ╹ ╹    ┗┛ ╹╹ ╹╹┗╸┗━╸
"
" Vim-plug initialization, don't modify! {{{
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif
"<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>}}}

" Active plugins {{{
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Hail to the Pope!
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'

" Easy motion
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

" Better autocompletion, searching best
" Plug 'davidhalter/jedi-vim'
" Plug 'python-rope/ropevim'
Plug 'ycm-core/YouCompleteMe'

" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Python and other languages code checker
Plug 'scrooloose/syntastic'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()
" }}}

" Install plugins the first time vim runs {{{
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif
"<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>}}}

" Vim settings and mappings {{{

" no vi-compatible
set nocompatible magic

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" splits
set splitbelow splitright

" enable folding
set foldmethod=indent
set foldlevel=9

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2

" mouse
set mouse=a

" tab length exceptions on some file types
augroup short_indents
    autocmd!
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set number

" no wrap for code by default, but if so do it wise
set nowrap linebreak

" local leader
let maplocalleader = "_"

" netrw
let g:netrw_winsize = 25
" let g:netrw_liststyle = 3

" tab navigation mappings
map <c-s-right> :tabn<cr>
tmap <c-s-right> <c-w>:tabn<cr>
imap <c-s-right> <esc>:tabn<cr>
map <c-s-left> :tabp<cr>
tmap <c-s-left> <c-w>:tabp<cr>
imap <c-s-left> <esc>:tabp<cr>

" navigate windows with ctrl+arrows
map <c-right> <c-w>l
map <c-left> <c-w>h
map <c-up> <c-w>k
map <c-down> <c-w>j
tmap <c-right> <c-w>l
tmap <c-left> <c-w>h
tmap <c-up> <c-w>k
tmap <c-down> <c-w>j
imap <c-right> <esc><c-w>l
imap <c-left> <esc><c-w>h
imap <c-up> <esc><c-w>k
imap <c-down> <esc><c-w>j

" fun keys
nnoremap <f1> :cwindow<cr>
nnoremap <f2> :w<cr>
nnoremap <f3> :e<cr>
" insert new freq utils here!
" ...
nnoremap <f12> :term<cr>
tnoremap <f12> <c-u><c-d>

" run debug keys
augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <f5> :!clear;python3 %<cr>
augroup END
augroup filetype_go
    autocmd!
    autocmd FileType go nnoremap <f5> :!clear;go run %<cr>
augroup END
augroup filetype_sh
    autocmd!
    autocmd FileType sh nnoremap <f5> :!zsh %<cr>
augroup END

" autofolding vimrc
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
augroup autosave_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
augroup END

nnoremap <leader>t :AirlineTheme<space>
nnoremap <leader>c :colorscheme<space>
nnoremap <leader>w :set wrap!<cr>

" reopen files on last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" autosave on lost focus
au FocusLost * silent! wa
" %% for current file dir
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" rip grep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" airline tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_splits = 0

" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
set completeopt-=preview
set completeopt+=menuone

" save as sudo
ca w!! w !sudo tee "%"

" when scrolling, keep cursor lines away from screen border
set scrolloff=2

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif
" }}}

"_.--.__.-'""`-.__.--.__.-'""`-.__.--.__.-'""`-.__.--.__.-'""`-._
""`--'""`-.__.-'""`--'""`-.__.-'""`--'""`-.__.-'""`--'""`-.__.-'"

" Plugins settings and mappings {{{
" Fugitive -----------------------------------------
autocmd BufReadPost fugitive://* set bufhidden=delete

" Syntastic ------------------------------

nmap <leader>e :Errors<cr>
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['python', 'pep8', 'mypy']
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" YCM  ------------------------------
" tab for ultisnips, not you
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'angr'

" EasyMotion ------------------
map gs <plug>(easymotion-prefix)
