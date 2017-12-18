" ------------------------------
" Name: _vimrc
" Author:Thilina
" Email: 15915940450@139.com
" ------------------------------

" Startup {{{
filetype indent plugin on

" 啓動時窗口最大化
autocmd GUIEnter * simalt ~x

augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=78

augroup END

" vim 文件折叠方式为 marker
augroup ft_vim
  au!

  autocmd FileType vim setlocal foldmethod=marker

  " 打开文件总是定位到上次编辑的位置
  autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

augroup END
" }}}

" General {{{
set nocompatible
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed

" 设置 alt 键不映射到菜单栏
set winaltkeys=no
" }}}

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }}}

" GUI {{{
colorscheme desert

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorline
set hlsearch
set number

" 窗口大小
set lines=35 columns=135

" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright

"不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b

" 使用内置 tab 样式而不是 gui
set guioptions-=e

" set nolist
set listchars=trail:·,extends:>,precedes:<

" Inconsolata字體
set guifont=Inconsolata:h12:cANSI

set statusline=%f
set statusline+=%m
set statusline+=\ %{fugitive#head()}
set statusline+=%=
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''}
set statusline+=/
set statusline +=%{&ff}
set statusline+=\ -\
set statusline+=%l/%L
set statusline+=[%p%%]
set statusline+=\ -\
set statusline +=%1*\ %y\ %*
" }}}

" Format {{{
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set foldmethod=indent
syntax on
" }}}

" Keymap {{{
let mapleader=","

nmap <leader>s :source $MYVIMRC<cr>
nmap <leader>e :e $MYVIMRC<cr>
nmap <leader>tn :tabnew<cr>
nmap <leader>tc :tabclose<cr>
" nmap <C-j> <C-W>j
" nmap <C-k> <C-W>k
nmap <M-n> <C-W>h
nmap <M-m> <C-W>l
nnoremap <M-j> :resize +5<cr>
nnoremap <M-k> :resize -5<cr>
nnoremap <M-h> :vertical resize -5<cr>
nnoremap <M-l> :vertical resize +5<cr>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-n> <left>
inoremap <M-m> <Right>
nnoremap vv ^vg_
inoremap <C-u> <esc>mzgUiw`za
nnoremap <F2> :setlocal number!<cr>
nnoremap <leader>w :set wrap!<cr>
imap <C-v> "+gP
vmap <C-c> "+y
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
imap <C-V> "+gP
map <S-Insert> "+gP
cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
nmap <silent> <leader>x :!start explorer %:p:h<CR>
nmap <silent> <leader>cmd :!start cmd /k cd %:p:h<cr>
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
" }}}

" Plugin {{{
filetype off

set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM/vimfiles/bundle')

" ----- Vundle ----- {{{
Plugin 'VundleVim/Vundle.vim'
" }}}
" ----- nerdtree ----- {{{
Plugin 'scrooloose/nerdtree'

 let NERDTreeIgnore=['.idea', '.vscode', 'node_modules', '*.pyc']
 let NERDTreeBookmarksFile = $VIM . '/NERDTreeBookmarks'
 let NERDTreeMinimalUI = 1
 let NERDTreeBookmarksSort = 1
 let NERDTreeShowLineNumbers = 0
 let NERDTreeShowBookmarks = 1
 let g:NERDTreeWinPos = 'right'
 let g:NERDTreeDirArrowExpandable = '+'
 let g:NERDTreeDirArrowCollapsible = '-'
 nmap <leader>n :NERDTreeToggle <cr>
 "
 "if exists('g:NERDTreeWinPos')
     "autocmd vimenter * NERDTree C:\wamp64\www\CMS-FrontEnd
     "autocmd vimenter * NERDTree $HOME\gvimnerdtree
 "endif
" }}}
" ----- ctrlp ----- {{{
Plugin 'kien/ctrlp.vim'
 let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
 set wildignore+=*\\.git\\*,*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc
" }}}
" ----- nerdcommenter ----- {{{
Plugin 'scrooloose/nerdcommenter'
" }}}
" ----- emmet-vim ----- {{{
Plugin 'mattn/emmet-vim'
" }}}
" ----- vim-fugitive(expo) ----- {{{
Plugin 'tpope/vim-fugitive'
" }}}
" ----- syntastic(expo) ----- {{{
Plugin 'vim-syntastic/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  "let g:syntastic_<filetype>_checkers = ['<checker-name>']

  "HTMLHint.................|syntastic-html-htmlhint|
  let g:syntastic_html_checkers = ['htmlhint']
  "ESLint...................|syntastic-javascript-eslint|
  let g:syntastic_javascript_checkers = ['eslint']
" }}}
" ----- vim-surround(expo) ----- {{{
Plugin 'tpope/vim-surround'
" }}}
" ----- vim-vue ----- {{{
Plugin 'posva/vim-vue'
" }}}

filetype on
call vundle#end()
" }}}

" Function {{{
" Remove trailing whitespace when writing a buffer, but not for diff files.
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
" }}}
