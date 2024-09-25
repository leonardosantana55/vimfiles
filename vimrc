"""""""THIS IS MY VIMRC""""""""


"disables the *compatible* to vi, which causes many bugs and must be at the
"beginning of the vimrc file.
if &cp | set nocp | endif

let mapleader=" "

""""""""config for netwr""""""""
let g:netrw_banner = 0 "to toggle use I
""let g:netrw_browse_split = 4 "same as using P
let g:netrw_altv = 1
let g:netrw_liststyle = 0
let g:netrw_winsize = 25
map <Leader>fe :Lexplore %:p:h<CR>
let g:netrw_keepdir = 0

""""""""set various options for the text editor""""""""
set sessionoptions+=unix,slash
set autochdir
set autoindent
set smartindent
set splitright
set splitbelow
set number
set title
if has("win32")
	set clipboard=unnamed
else
	set clipboard=unnamedplus
endif
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
let session_name=fnamemodify(v:this_session, ':t')
set statusline=%F\ %{'session_name:'}\%{session_name}\ %=\ %l\:%c\ 
set wrap
set tw=99
set ts=4
set shiftwidth=4
set smartcase
set incsearch
"set backspace=indent,eol,start
set scrolloff=10
set sidescrolloff=10
if !exists("g:syntax_on")
    syntax enable
endif
if has("win32") 
	set shell=C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe
endif


""""""""mostly mappings for the normal mode text editor""""""""
map <Leader>cs :nohlsearch<CR>
map <Leader>ws :w<CR>:source<CR>
if has("win32")
	map <Leader>cv :vs<CR>:edit $MYVIMRC<cr>
else
	map <Leader>cv :vs<CR>:edit ~/.vim/vimfiles/vimrc<cr>
endif

map gg gg0
map G G$
vnoremap gg gg0
vnoremap G G$

"deletes without overwriting the register
map <Leader>d "_d


""""""Terminal config stuff""""""
if has("win32")
	let term_name = "powershell"
else
	let term_name = "bin/bash"
endif

command! CopyBuffer let @+ = expand('%:p:h')

"this function is used in conjuntion with <Leader>nt. You just need to cd and
"paste its value to load the terminal for the current files path
map <Leader>cb :CopyBuffer<CR>

"saves and ends session
map <Leader>ssqa :wall!<CR>:execute "mksession! " .. v:this_session<CR>:qa!<CR>

"this variable is used in conjuntion with <Leader>nt and <Leader>\
let term_size = 10

map <Leader>nt :CopyBuffer<CR>:execute ':bo term ++rows=' . term_size<CR>

nnoremap <Leader>\ :execute ':bo sb ' . term_name<CR>:execute ':res' . term_size<CR>i
tnoremap <Leader>\  <C-\><C-n>:hide<CR>


""""""""quotes brackets and parentesis auto match""""""""
inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap () ()<left>
inoremap [ []<left>
inoremap [] []<left>
inoremap { {}<left>
inoremap {} {}<left>
inoremap {<cr> {}<left><cr><cr><up><tab>


colorscheme habamax

function! CommentFunction()
	let current_line = line(".")

	call append(current_line,	"/******************************************************************************")
	call append(current_line+1, "*Name:")
	call append(current_line+2, "*Description")
	call append(current_line+3, "*")
	call append(current_line+4, "*")
	call append(current_line+5, "*Parameters")
	call append(current_line+6, "*")
	call append(current_line+7, "*")
	call append(current_line+8, "*Returns:")
	call append(current_line+9,	"******************************************************************************/")

endfunc

map <Leader>cf :call CommentFunction()<CR>

"rename all occurences(select text and press key)
"provavelmente está errado vnoremap: <Leader>ra "\"hy:%s/\\<<C-r>h\\>//g<left><left>>") 


"TODO: create a shortcut to add comment block depending on the current filetype"
"TODO: check if cursor is in the middle of a word and if true put the quotes
"around the word
"TODO: use winheight({nr})}) to set the term_size when executing <Leader>\ to
"hide
