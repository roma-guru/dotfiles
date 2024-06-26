"                    .
"    ##############..... ##############
"    ##############......##############
"      ##########..........##########
"      ##########........##########
"      ##########.......##########
"      ##########.....##########..
"      ##########....##########.....
"    ..##########..##########.........
"  ....##########.#########.............
"    ..################JJJ............
"      ################.............
"      ##############.JJJ.JJJJJJJJJJ
"      ############...JJ...JJ..JJ  JJ
"      ##########....JJ...JJ..JJ  JJ
"      ########......JJJ..JJJ JJJ JJJ
"      ######    .........
"                  .....
"                    .

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
" }}}

"_.--.__.-'""`-.__.--.__.-'""`-.__.--.__.-'""`-.__.--.__.-'""`-._
""`--'""`-.__.-'""`--'""`-.__.-'""`--'""`-.__.-'""`--'""`-.__.-'"

" Active plugins {{{
call plug#begin('~/.vim/plugged')

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'

" Distraction free
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

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
" Plug 'tpope/vim-projectionist'

" Easy motion
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tommcdo/vim-exchange'
" Plug 'kana/vim-textobj-user'

" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Python and other languages code checker
Plug 'dense-analysis/ale'

" Python
Plug 'davidhalter/jedi-vim'
" Plug 'python-rope/ropevim'
" Plug 'alfredodeza/pytest.vim'

" Golang
Plug 'fatih/vim-go'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()
" }}}

" Install plugins the first time vim runs {{{
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif
"}}}

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

" universal quit
nmap Q <c-w>c

" fun keys
nnoremap <c-s> :w<cr>
" insert new freq utils here!
" ...
nmap <c-`> :term<cr>
tmap <c-`> <c-u><c-d>

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
    autocmd BufWinLeave *.* silent! mkview
    autocmd BufWinEnter *.* silent! loadview
augroup END

" autosave on window focus changed
autocmd WinLeave :w<cr>

vnoremap <leader>y "+y

let g:airline_theme = 'base16color'
command! AirlineThemes call fzf#run({
  \ 'source':  ["random"] + map(split(globpath(&rtp, 'autoload/airline/themes/*.vim'), "\n"),
  \               "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
  \ 'sink':    'AirlineTheme',
  \ 'options': '+m --prompt="AirlineThemes> "',
  \ 'down':    '~40%'
  \})
nnoremap <leader>t :AirlineThemes<cr>
nnoremap <leader>c :Colors<cr>
nnoremap <leader>q :History:<cr>
nnoremap <leader>T :Tags<cr>

" reopen files on last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" autosave on lost focus
au FocusLost * silent! wa
" %% for current file dir
cnoremap %% <C-R>=expand('%:h').'/'<cr>

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
command Merge Gvdiffsplit!

" FZF -----------------------
let g:fzf_preview_window = []

" ALE  ------------------------------
nmap <leader>e :Errors<cr>
let g:ale_linters = {'python': ['mypy', 'flake8']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '*'
let g:ale_sign_warning = '.'

" YCM  ------------------------------
" tab for ultisnips, not you
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Airline ------------------------------
let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#enabled = 0

" Python ----------------------
" python 3.7 syntax for all
let g:python_highlight_all = 1

" EasyMotion ------------------
map gs <plug>(easymotion-prefix)

" Limelight -------------------------------
let g:limelight_conceal_ctermfg = 'darkgray'
