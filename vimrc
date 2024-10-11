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
set autochdir                          " new terminal opens in current files dir 
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
set smartcase
set showcmd
set wildmenu
set wildmode=list:full
set showmode
set showtabline=1
set laststatus=2
set nowrap
set sidescroll=5
set scrolloff=5
set sidescrolloff=5
set list
set lcs=tab:»»,multispace:____,lead:\ ,extends:»,trail:•
set formatoptions=
set formatoptions+=t
set formatoptions+=c
set formatoptions+=r
set textwidth=100
set tabstop=4
set expandtab                          "spaces are more reliable for formating accros devices
set shiftwidth=4
set incsearch
set hlsearch
set backspace=indent,eol,start
set belloff=all                        "stops annoying bell 
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
map <Leader>ws :w<CR>:source<CR>:nohlsearch<CR>|           "last command is for clearing the annoying search highligth
if has("win32")
    map <Leader>cv :vs<CR>:edit $MYVIMRC<cr>
else
    map <Leader>cv :vs<CR>:edit ~/.vim/vimfiles/vimrc<cr>
endif
"the original behavior can be done with [[ and ]]
map gg gg0
map G G$
vnoremap gg gg0
vnoremap G G$

map <Leader>d "_d|                     " deletes without overwriting the register

"move line up and down"
nnoremap <F4> :move +1<CR>
nnoremap <F5> :move -2<CR>



""""""TERMINAL CONFIG STUFF""""""
if has("win32")
    let term_name = "powershell"
else
    let term_name = "bin/bash"
endif
"new terminal functionallity
command! CopyBuffer let @+ = expand('%:p:h')
map <Leader>cb :CopyBuffer<CR>|                  " used in conjuntion with <Leader>nt. cd and paste it on terminal
map <Leader>ssqa :wall!<CR>:execute "mksession! " .. v:this_session<CR>:qa!<CR>| " saves and ends session
let term_size = 10                               " this variable is used in conjuntion with <Leader>nt and <Leader>
map <Leader>nt :CopyBuffer<CR>:execute ':bo term ++rows=' . term_size<CR>
nnoremap <Leader>\ :execute ':bo sb ' . term_name<CR>:execute ':res' . term_size<CR>i
tnoremap <Leader>\  <C-\><C-n>:hide<CR>


""""""""QUOTES BRACKETS AND PARENTESIS AUTO MATCH""""""""
function! InsertMatchPair(char, match)
" checks if cursor has chars in front of it
    let next_char = getline(".")[col(".")] 
    let line = getline('.')
    if next_char == "" || next_char == " " || next_char == a:char 
    \ || next_char == a:match[1]
    \ || next_char == '"'
    \ || next_char == "'"
    \ || next_char == ")"
    \ || next_char == "]"
    \ || next_char == "}"
        call setline('.', strpart(line, 0, col('.') ) . a:match . strpart(line, col('.') ))
    else
        if col('.') == 1
            call setline('.', strpart(line, 0, col('.') -1 ) . a:char . strpart(line, col('.') -1 ))
        else
            call setline('.', strpart(line, 0, col('.') ) . a:char . strpart(line, col('.') ))
        endif
    endif
    call cursor('.', col('.')+2)
    execute ':start'
endfunc

inoremap " <esc>:call InsertMatchPair('"', '""')<CR>
inoremap ' <esc>:call InsertMatchPair("'", "''")<CR>
inoremap ( <esc>:call InsertMatchPair('(', '()')<CR>
inoremap [ <esc>:call InsertMatchPair('[', '[]')<CR>
inoremap { <esc>:call InsertMatchPair('{', '{}')<CR>

inoremap {<cr> {<cr>}<left><cr><up><tab>| " this mapping only works with smartinend and autoindent surround selection

vnoremap <Leader>" <esc>a"<esc>`<i"
vnoremap <Leader>' <esc>a'<esc>`<i'
vnoremap <Leader>( <esc>a)<esc>`<i(
vnoremap <Leader>[ <esc>a]<esc>`<i[
vnoremap <Leader>{ <esc>a}<esc>`<i{
vnoremap <Leader>/ <esc>a*/<esc>`<i/*


""""""""COMMENT SNIPETS STUFF FOR C PROGRAMMING""""""""
function! CommentFunction()
    let current_line = line(".")
    call append(current_line,   "/******************************************************************************")
    call append(current_line+1, "*Name:")
    call append(current_line+2, "*Description:")
    call append(current_line+3, "*")
    call append(current_line+4, "*")
    call append(current_line+5, "*Parameters:")
    call append(current_line+6, "*")
    call append(current_line+7, "*")
    call append(current_line+8, "*Returns:")
    call append(current_line+9, "******************************************************************************/")
endfunc

"use this function to start comments aways on the same ideal_comment_col or 12 spaces away from last char
function! CommentVariable()
    normal $
    let current_col = col(".")
    let ideal_comment_col = 40
    let distance = ideal_comment_col - current_col
    "if it is longer put 4 spaces
    if distance <= 0
        call feedkeys("a    ",'t')
    else
        while distance > 0
            call feedkeys("a \<esc>",'t')
            let distance -= 1
        endwhile
    endif
    normal a
endfunc

map <Leader>cf :call CommentFunction()<CR>2jA
map <Leader>cc :call CommentVariable()<CR>

colorscheme habamax


"rename all occurences(select text and press key)
"provavelmente está errado vnoremap: <Leader>ra "\"hy:%s/\\<<C-r>h\\>//g<left><left>>") 

"TODO: criar autocomment on newline"


