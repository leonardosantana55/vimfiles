let mapleader=" "
let g:netrw_banner = 0
"let g:netrw_browse_split = 4 "same as using P
let g:netrw_altv = 1
let g:netrw_liststyle = 0
let g:netrw_winsize = 25
set splitright
set splitbelow
set number
set title
set clipboard=unnamed
set nobackup
set relativenumber
set ignorecase
set showcmd
set wildmenu
set wildmode=list:full
set showmode
set showtabline=1
set laststatus=2
set ignorecase
set hlsearch
set wrap
set tw=79
set ts=4
set smartcase
set incsearch
set backspace=indent,eol,start
set scrolloff=10
set sidescrolloff=10
if !exists("g:syntax_on")
    syntax enable
endif

if has("win32") 
	set shell=C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe
endif

map <Leader>cs :nohlsearch<CR>
map <Leader>ws :w<CR>:source<CR>
map <Leader>cv :edit $MYVIMRC<cr>
map gg gg0
map G G$
map <Leader>d "_d
map <Leader>cb :CopyBuffer<CR>
map <Leader>fe :Lex<CR>

" quotes brackets and parentesis auto match
inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap () ()<left>
inoremap [ []<left>
inoremap [] []<left>
inoremap { {}<left>
inoremap {} {}<left>
inoremap {<cr> {}<left><cr><cr><up><tab>

"rename all occurences(select text and press key)
"provavelmente está errado vnoremap: <Leader>ra "\"hy:%s/\\<<C-r>h\\>//g<left><left>>") 


vnoremap gg gg0
vnoremap G G$

command! CopyBuffer let @+ = expand('%:p')
colorscheme elflord
