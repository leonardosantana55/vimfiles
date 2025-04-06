"""""""THIS IS MY VIMRC""""""""
" in this config I try to create a portable vim with little functionality added. Always trying to leave
" vim as it is and keeping the customization to a minimum, thus also keeping side effects to a minimum.

" disables the *compatible* to vi, which causes many bugs. Must be at the beginning of the vimrc file.
if &cp | set nocp | endif
let mapleader=" "


""""""""CONFIG FOR NETWR""""""""

function! Explorer2()
    if &filetype != "netrw"
        execute ":Explore"
    else
        execute ":Rexplore"
    endif
endfunc

let g:netrw_banner = 0                 " to toggle it, use I
""let g:netrw_browse_split = 4         " same as using P
let g:netrw_altv = 1
let g:netrw_liststyle = 0
let g:netrw_winsize = 25
" map <Leader>fe :Lexplore %:p:h<CR>-<CR>| " <CR>-<CR> is a quick fix for a bug :Lexplore is cursed
map <Leader>fe :call Explorer2()<CR>
let g:netrw_keepdir = 0


""""""""CONFIG STATUSLINE""""""""
"autocmd VimEnter * is used here to load the config after everything else

autocmd VimEnter * set statusline=%#StatusLine#
autocmd VimEnter * set statusline+=%F
autocmd VimEnter * set statusline+=\ %#DiffAdd#
autocmd VimEnter * set statusline+=%m
autocmd VimEnter * set statusline+=%#StatusLine#
autocmd VimEnter * set statusline+=%<
autocmd VimEnter * let session_name=fnamemodify(v:this_session, ':t')
autocmd VimEnter * set statusline+=\ %{'s('}\%{session_name}\%{')'}
autocmd VimEnter * set statusline+=%=
autocmd VimEnter * set statusline+=%n
autocmd VimEnter * set statusline+=\ %p%%
autocmd VimEnter * set statusline+=\ %l\:%c
autocmd VimEnter * set statusline+=\ 


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
set wildoptions=pum
set wildmenu
" set wildmode=list:full
set wildmode=full
set showmode
set showtabline=2
set laststatus=2
set nowrap
set sidescroll=5
set scrolloff=5
set sidescrolloff=5
set list
set lcs=tab:»\ ,multispace:____,lead:\ ,extends:»,trail:•
set formatoptions=
set formatoptions+=t
set formatoptions+=c
set formatoptions+=r
set textwidth=0
" set colorcolumn=80
" But set it to 100 chars when editing Kotlin.
" autocmd filetype kotlin setlocal colorcolumn=100
" Only show the colorcolumn in the current window.
" autocmd WinLeave * set colorcolumn=0
" autocmd WinEnter * set colorcolumn=80

set tabstop=4
set softtabstop=-1
set expandtab                          "spaces are more reliable for formating accros devices
set shiftwidth=4
set incsearch
set hlsearch
set backspace=indent,eol,start
set belloff=all                        "stops annoying bell 
" set cursorline
if !exists("g:syntax_on")
    syntax enable
endif 

" make cursor blink
if &term =~ 'xterm' || &term == 'win32'
    " Use DECSCUSR escape sequences
    let &t_SI = "\e[5 q"    " blink bar
    let &t_SR = "\e[3 q"    " blink underline
    let &t_EI = "\e[1 q"    " blink block
    let &t_ti ..= "\e[1 q"  " blink block
    let &t_te ..= "\e[0 q"  " default (depends on terminal, normally blink
                " block)
    endif


""""""""MOSTLY MAPPINGS FOR THE NORMAL MODE TEXT EDITOR""""""""
map <Leader>cs :nohlsearch<CR>
map <Leader>ws :w<CR>:source<CR>:nohlsearch<CR>|           "last command is for clearing the annoying search highligth
if has("win32")
    map <Leader>cv :vs<CR>:edit $MYVIMRC<cr>
else
    map <Leader>cv :vs<CR>:edit ~/.vim/vimfiles/vimrc<cr>
endif
map gg gg0
map G G$
vnoremap gg gg0
vnoremap G G$
nmap ]] /[{}]<CR>:nohlsearch<CR>
nmap [[ ?[{}]<CR>:nohlsearch<CR>

map <Leader>d "_d|                     " deletes without overwriting the register

"move line up and down"
nnoremap <F5> :move +1<CR>
nnoremap <F6> :move -2<CR>

nnoremap <F9> @:|                       " repeat last command

command! CopyBuffer let @+ = expand('%:p:h')
map <Leader>cb :CopyBuffer<CR>|                  " used in conjunction with <Leader>nt. cd and paste it on terminal
map <Leader>ssqa :wall!<CR>:execute "mksession! " .. v:this_session<CR>:qa!<CR>| " saves and ends session

"im ready for vim hard mode, im a grown up now, im a man
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

""""""TERMINAL CONFIG STUFF""""""

" init
if has("win32")
    if executable("C:\\Program Files\\PowerShell\\7\\pwsh") == 1    " check if the executable exists
        set shell=\"C:\\Program\ Files\\PowerShell\\7\\pwsh\"    " my pc
    else
        set shell=C:\\PowerShell-7.4.5-win-x64\\pwsh.exe"    " engies pc
    endif
endif

if has("win32")
    let term_name = "powershell"
else
    let term_name = "bin/bash"
endif

let term_size = 10                               " used in conjunction with <Leader>nt and <Leader>
let term_bufname = term_name
" map <Leader>nt :CopyBuffer<CR>:execute ':bo term ++rows=' . term_size<CR>
" nnoremap <Leader>\ :execute ':bo sb ' . term_name<CR>:execute ':res' . term_size<CR>i

function! TermCreate()
    " toggle on and off a terminal on the botton of the screen"

    " we can have only one terminal at a time."
    let buf_info = getbufinfo()->matchfuzzy(g:term_name, {'key' : 'name'})
    if len(buf_info) == 0
        execute ':bo term ++rows=' .. g:term_size
        let g:term_bufname = bufname()
        return
    else
        " prevent creating aditional window for term buffer"
        if getbufinfo(g:term_bufname)[0].hidden == 1
            execute ':bo sb ' . g:term_name 
            execute ':res' . g:term_size
            normal i
        else
            call win_gotoid(win_findbuf(bufnr(g:term_name))[0])
        endif
    endif
endfunc

function! TermHidenResize()
    let g:term_size = winheight(0)
    execute ':hide'
endfunc

nnoremap <Leader>\ :call TermCreate()<CR>
tnoremap <Leader>\  <C-\><C-n>:call TermHidenResize()<CR>
tnoremap <esc><esc> <C-\><C-n>


""""""""QUOTES BRACKETS AND PARENTHESIS AUTO MATCH""""""""

function! InsertMatchPair(char, match)
" checks if cursor has chars in front of it and adds a maching pair of some chars
" has a side effect that affects commenting many lines at once with visual block + <S-i>
" is overcome by <Leader>" or <Leader>#. Other chars might be added latter

    let next_char = getline(".")[col(".")] 
    let line = getline('.')

" maily for closing brackets, but works on same char also.
    if next_char == a:char
        execute ':start'
        call cursor( line('.'), col('.') + 2)
        return
    endif

" handles openning brackets behavior only
    if next_char == "" || next_char == " " || next_char == a:char
    \ || next_char == a:match[1]
    \ || next_char == '"'
    \ || next_char == "'"
    \ || next_char == ")"
    \ || next_char == "]"
    \ || next_char == "}"
        call setline('.', strpart(line, 0, col('.') ) . a:match . strpart(line, col('.') ))
    else
        if col('.') == 1                " edge case when cursor is on first column and it is not empty
            call setline('.', strpart(line, 0, col('.') -1 ) . a:char . strpart(line, col('.') -1 ))
            execute ':start'
            call cursor('.', col('.')+1)       " positions cursor at the rigth place and in insert mode
            return
        else
            call setline('.', strpart(line, 0, col('.') ) . a:char . strpart(line, col('.') ))
        endif
    endif

    call cursor('.', col('.')+2)       " positions cursor at the rigth place and in insert mode
    execute ':start'
endfunc

inoremap " <esc>:call InsertMatchPair('"', '""')<CR>
inoremap ' <esc>:call InsertMatchPair("'", "''")<CR>
inoremap ( <esc>:call InsertMatchPair('(', '()')<CR>
inoremap [ <esc>:call InsertMatchPair('[', '[]')<CR>
inoremap { <esc>:call InsertMatchPair('{', '{}')<CR>

inoremap ) <esc>:call InsertMatchPair(')', ')')<CR>
inoremap ] <esc>:call InsertMatchPair(']', ']')<CR>
inoremap } <esc>:call InsertMatchPair('}', '}')<CR>

inoremap {<cr> {<cr>}<left><cr><up><tab>| " this mapping only works with smart indent and auto indent surround.

vnoremap <Leader>" <esc>a"<esc>`<i"
vnoremap <Leader>' <esc>a'<esc>`<i'
vnoremap <Leader>( <esc>a)<esc>`<i(
vnoremap <Leader>[ <esc>a]<esc>`<i[
vnoremap <Leader>{ <esc>a}<esc>`<i{
vnoremap <Leader>/ <esc>a*/<esc>`<i/*


""""""""COMMENT SNIPPETS STUFF FOR C PROGRAMMING"""""""
" function! CommentFunction()
"     let current_line = line(".")
"     call append(current_line,   "/******************************************************************************")
"     call append(current_line+1, "*Name:")
"     call append(current_line+2, "*Description:")
"     call append(current_line+3, "*")
"     call append(current_line+4, "*")
"     call append(current_line+5, "*Parameters:")
"     call append(current_line+6, "*")
"     call append(current_line+7, "*")
"     call append(current_line+8, "*Returns:")
"     call append(current_line+9, "******************************************************************************/")
" endfunc

function! CommentFunction()
    let current_line = line(".")
    call append(current_line,   "/******************************************************************************")
    call append(current_line+1, "*Function Description:")
    call append(current_line+2, "")
    call append(current_line+3, "")
    call append(current_line+4, "")
    call append(current_line+5, "******************************************************************************/")
endfunc

" use this function to start comments always on the same ideal_comment_col or 12 spaces away from last char
function! CommentVariable()
    normal $
    let current_col = col(".")
    let ideal_comment_col = 40
    let distance = ideal_comment_col - current_col
    " if it is a long line put 4 spaces
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

" comment out multiple lines
nnoremap <Leader>co :normal!0i


colorscheme habamax
highlight ColorColumn ctermfg=0 ctermbg=7


if has("win32")
    autocmd VimEnter * execute ':source $MYVIMRC'
else
    autocmd VimEnter * execute ':source ~/.vim/vimfiles/vimrc'
endif


function DelBuffer()

    let buffer_count = len(getbufinfo({'buflisted':1}))
    let buffer_name = bufname()

    if buffer_count > 1
        execute ':b#'
        execute ':bd ' . buffer_name
    else
        execute ':echo cant delete'
    endif

endfunc




" TIPS: 
" To format a json file run the command :%!python -m json.tool"
" To change every ocurrence and ask for confirmation, use :%s/{oldpattern}/{newpattern}/gc"
