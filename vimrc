"""""""THIS IS MY VIMRC""""""""

"disables the *compatible* to vi, which causes many bugs and must be at the
"beginning of the vimrc file.
if &cp | set nocp | endif
let mapleader=" "


""""""""CONFIG FOR NETWR""""""""
let g:netrw_banner = 0 "to toggle use I
""let g:netrw_browse_split = 4 "same as using P
let g:netrw_altv = 1
let g:netrw_liststyle = 0
let g:netrw_winsize = 25
map <Leader>fe :Lexplore %:p:h<CR>-<CR>
let g:netrw_keepdir = 0


""""""""CONFIG STATUSLINE""""""""
"autocmd VimEnter * is used here to load the config after everything else
autocmd VimEnter * let session_name=fnamemodify(v:this_session, ':t')
autocmd VimEnter * set statusline=%F\ %{'SESSION_NAME:'}\%{session_name}\ %=\ %l\:%c\ 


""""""""SET VARIOUS OPTIONS FOR THE TEXT EDITOR""""""""
set sessionoptions+=unix,slash
set autochdir
set! autoindent
set! smartindent
set splitright
set splitbelow
set number
set relativenumber
set title
if has("win32")
	set clipboard=unnamed
else
	set clipboard=unnamedplus
endif
set nobackup
set ignorecase
set showcmd
set wildmenu
set wildmode=list:full
set showmode
set showtabline=1
set laststatus=2
set ignorecase
set wrap
set tw=99
set ts=4
set shiftwidth=4
set smartcase
set incsearch
set backspace=indent,eol,start
set scrolloff=10
set sidescrolloff=10
if !exists("g:syntax_on")
    syntax enable
endif
if has("win32") 
	try
		set shell=C:\PowerShell-7.4.5-win-x64\pwsh.exe
	catch
		set shell=C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe
	endtry	
endif


""""""""MOSTLY MAPPINGS FOR THE NORMAL MODE TEXT EDITOR""""""""
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

map <Leader>d "_d|                               " deletes without overwriting the register


""""""TERMINAL CONFIG STUFF""""""
if has("win32")
	let term_name = "powershell"
else
	let term_name = "bin/bash"
endif
command! CopyBuffer let @+ = expand('%:p:h')
map <Leader>cb :CopyBuffer<CR>|                  " used in conjuntion with <Leader>nt. cd and paste it on terminal
map <Leader>ssqa :wall!<CR>:execute "mksession! " .. v:this_session<CR>:qa!<CR>| " saves and ends session
let term_size = 10                               " this variable is used in conjuntion with <Leader>nt and <Leader>
map <Leader>nt :CopyBuffer<CR>:execute ':bo term ++rows=' . term_size<CR>
nnoremap <Leader>\ :execute ':bo sb ' . term_name<CR>:execute ':res' . term_size<CR>i
tnoremap <Leader>\  <C-\><C-n>:hide<CR>


""""""""QUOTES BRACKETS AND PARENTESIS AUTO MATCH""""""""
inoremap "" ""<left>
inoremap '' ''<left>
inoremap () ()<left>
inoremap [] []<left>
inoremap {} {}<left>
inoremap {<cr> {<cr>}<left><cr><up><tab>| " this mapping only works with smartinend and autoindent
inoremap (" ("")<left><left>
"surround word o paragraph
vnoremap <Leader>" <esc>a"<esc>`<i"
vnoremap <Leader>' <esc>a"<esc>`<i"
vnoremap <Leader>( <esc>a"<esc>`<i"
vnoremap <Leader>[ <esc>a"<esc>`<i"
vnoremap <Leader>{ <esc>a"<esc>`<i"
vnoremap <Leader>/ <esc>a*/<esc>`<i/*


""""""""COMMENT SNIPETS STUFF FOR C PROGRAMMING""""""""
function! CommentFunction()
	let current_line = line(".")
	call append(current_line,	"/******************************************************************************")
	call append(current_line+1, "*Name:")
	call append(current_line+2, "*Description:")
	call append(current_line+3, "*")
	call append(current_line+4, "*")
	call append(current_line+5, "*Parameters:")
	call append(current_line+6, "*")
	call append(current_line+7, "*")
	call append(current_line+8, "*Returns:")
	call append(current_line+9,	"******************************************************************************/")
endfunc

function! CommentVariable()
	normal $
	let current_col = col(".")
	let ideal_comment_col = 50
	let distance = ideal_comment_col - current_col
	
	let var_comment = "/* ??? */"
	if distance <= 0
		call append(line(".")-1, join(["    ",var_comment],""))
		normal Jx
	else
		let spaces = ""
		while distance > 0
			let spaces = join([' ', spaces],"")
			let distance -= 1
		endwhile
		call append(line("."), var_comment)
		normal J
		execute ':normal a' .. spaces
	endif
endfunc

map <Leader>cf :call CommentFunction()<CR>2jA
map <Leader>cc :call CommentVariable()<CR>2wviw


colorscheme habamax


"rename all occurences(select text and press key)
"provavelmente está errado vnoremap: <Leader>ra "\"hy:%s/\\<<C-r>h\\>//g<left><left>>") 


"TODO: create a shortcut to add comment block depending on the current filetype"
"TODO: check if cursor is in the middle of a word and if true put the quotes
"around the word
"TODO: use winheight({nr})}) to set the term_size when executing <Leader>\ to
"hide
