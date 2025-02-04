let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>
vmap  "*d
tnoremap  
nnoremap  co :normal!0i
map  cc :call CommentVariable()
map  cf :call CommentFunction()2jA
vnoremap  / a*/`<i/*
vnoremap  { a}`<i{
vnoremap  [ a]`<i[
vnoremap  ( a)`<i(
vnoremap  ' a'`<i'
vnoremap  " a"`<i"
tnoremap  \ :call TermHidenResize()
nnoremap  \ :call TermCreate()
map  ssqa :wall!:execute "mksession! " .. v:this_session:qa!
map  cb :CopyBuffer
map  d "_d
map  cv :vs:edit $MYVIMRC
map  ws :w:source:nohlsearch
map  cs :nohlsearch
map  fe :call Explorer2()
vnoremap G G$
nmap G G$
omap G G$
imap ÎÔ *
map! Îu <C-End>
map! Îw <C-Home>
nmap [[ ?[{}]:nohlsearch
nmap ]] /[{}]:nohlsearch
vnoremap gg gg0
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nmap gg gg0
omap gg gg0
vnoremap <Right> <Nop>
vnoremap <Left> <Nop>
vnoremap <Down> <Nop>
vnoremap <Up> <Nop>
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
nnoremap <Right> <Nop>
onoremap <Right> <Nop>
nnoremap <Left> <Nop>
onoremap <Left> <Nop>
nnoremap <Down> <Nop>
onoremap <Down> <Nop>
nnoremap <Up> <Nop>
onoremap <Up> <Nop>
nnoremap <F9> @:
nnoremap <F5> :move -2
nnoremap <F4> :move +1
inoremap " :call InsertMatchPair('"', '""')
inoremap ' :call InsertMatchPair("'", "''")
inoremap ( :call InsertMatchPair('(', '()')
inoremap ) :call InsertMatchPair(')', ')')
vmap ÎØ "*d
vmap Î× "*d
vmap ÎÕ "*y
vmap ÎÔ "-d"*P
nmap ÎÔ "*P
nmap Îu <C-End>
vmap Îu <C-End>
nmap Îw <C-Home>
vmap Îw <C-Home>
inoremap [ :call InsertMatchPair('[', '[]')
inoremap ] :call InsertMatchPair(']', ']')
inoremap { {}<Left><Up>	
inoremap { :call InsertMatchPair('{', '{}')
inoremap } :call InsertMatchPair('}', '}')
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set backspace=indent,eol,start
set belloff=all
set clipboard=unnamed
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set formatoptions=tcr
set helplang=En
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:Â»\ ,multispace:____,lead:\ ,extends:Â»,trail:â€¢
set scrolloff=5
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal,unix,slash
set shell=C:\\PowerShell-7.4.5-win-x64\\pwsh.exe
set shiftwidth=4
set showtabline=2
set sidescroll=5
set sidescrolloff=5
set smartcase
set smartindent
set softtabstop=-1
set splitbelow
set splitright
set statusline=%#StatusLine#%F\ %#DiffAdd#%m%#StatusLine#%<\ %{'s('}%{session_name}%{')'}%=%n\ %p%%\ %l:%c\ 
set tabstop=4
set textwidth=100
set title
set wildmenu
set wildoptions=pum
set window=50
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +170 ~/cprograms/learnSDL/hello.c
badd +14 ~/cprograms/learnSDL/ptrtest.c
badd +135 ~/vimfiles/vimrc
argglobal
%argdel
edit ~/cprograms/learnSDL/hello.c
argglobal
balt ~/cprograms/learnSDL/ptrtest.c
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal completeslash=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=tcr
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
set list
setlocal list
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal smartindent
setlocal nosmoothscroll
setlocal softtabstop=-1
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=100
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 170 - ((28 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 170
normal! 013|
lcd ~/cprograms/learnSDL
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
set shortmess=filnxtToOS
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
