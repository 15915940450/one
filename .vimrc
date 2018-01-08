"===============
"create by Thilina Fong H.C. (+86 15915940450)
"
"base on amix/vimrc
"===============

function! RemoveTrailingWhitespace()
  if &ft != "diff"
    let b:curcol = col(".")
    let b:curline = line(".")
    silent! %s/\s\+$//
    silent! %s/\(\s*\n\)\+\%$//
    call cursor(b:curline, b:curcol)
  endif
endfunction
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction




filetype plugin on
filetype indent on

let mapleader = ","
let g:mapleader = ","
"let g:loaded_matchparen=0

syntax enable
colorscheme tomorrow-night

set nocompatible
set autoread
set number
set foldmethod=indent
set nobackup
set noswapfile
set history=96
set nobomb
set fileencodings=utf-8,gbk2312,gbk
set encoding=utf-8
set hlsearch
set incsearch
set splitbelow
set splitright
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set ignorecase
set smartcase
set ruler
set cmdheight=2
set hid
set wrap
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


autocmd BufWritePre * call RemoveTrailingWhitespace()
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif






"VUNDLE===================================================================
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"===
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
"==ctrl+n
let NERDTreeIgnore = ['\.pyc$', '__pycache__','.idea', '.vscode', 'node_modules','*.zip', '*.pyc','*.so','TEST','*.xlsx','*.jpg','*.png','*.gif']
let NERDTreeMinimalUI = 0
let NERDTreeBookmarksSort = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeShowBookmarks = 1
let g:NERDTreeWinPos = 'right'

Plugin 'kien/ctrlp.vim'
"==ctrl+p
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/TEST/*,*.xlsx,*.jpg,*.png,*.gif

Plugin 'scrooloose/nerdcommenter'
"==<leader>+c then <space>
let g:NERDCustomDelimiters = { 'php': { 'left': '<!--','right': '-->' },'vue': { 'left': '/**','right': '*/' } }

Plugin 'mattn/emmet-vim'
"==ctrl+y then ,

Plugin 'tpope/vim-fugitive'

Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\.vue$']

"let g:syntastic_<filetype>_checkers = ['<checker-name>']
"HTMLHint.................|syntastic-html-htmlhint|
let g:syntastic_html_checkers = ['htmlhint']
"ESLint...................|syntastic-javascript-eslint|
let g:syntastic_javascript_checkers = ['eslint']

Plugin 'tpope/vim-surround'

Plugin 'vim-scripts/bufexplorer.zip'
"==<leader>+b then v

Plugin 'szw/vim-maximizer'

Plugin 'posva/vim-vue'
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
"==<F3>
"===

call vundle#end()            " required
filetype plugin indent on    " required
"=========================================================================







nnoremap <leader>e :e ~/.vimrc<cr>

"=====
nnoremap <C-n> :NERDTreeToggle<CR>
"=====

nnoremap <leader>w :set wrap!<cr>
nnoremap <leader><cr> :noh<cr>
nnoremap <leader>dt a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-i> :vertical resize -5<cr>
nnoremap <C-o> :vertical resize +5<cr>
nnoremap vv ^vg_

inoremap <C-u> <esc>mzgUiw`za
