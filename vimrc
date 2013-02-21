"                           Plugins Manager:
" ------------------------------------------------------------------
" All plugins are stored in ~/.vim/bundle using the pathongen plugin
call pathogen#infect('bundle')
" ------------------------End of Plugin Manager---------------------"

"                       Global Variable Definition:
let g:netrw_home = "/tmp"
let g:WMGraphviz_output = 'ps'
let g:clang_use_library = 0
let g:clang_library_path = "/usr/lib/llvm" " The path of clang
                                           " different dist will have differnt path
let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto=1 " add clang_complete option
let c_hi_identifiers = 'all' " Highlight C Identifiers
let c_hi_libs        = ['*'] " Highlight C Libs
" -----------------End of Global Variable Definition ---------------

"                           Options:
"-------------------------------------------------------------------
" [common options]
set nocompatible
let mapleader = ","
let g:mapleader = ","
filetype plugin on       		" Enable filetype plugin
filetype indent on
syntax on               		" Enable syntax hl
filetype on
set autochdir               	" Auto change PWD to where editing
set ambiwidth=double
language message en_US.UTF-8
set autoread                	" Auto read when a file is changed from the outside
set noerrorbells                " No sound on errors
set novisualbell                " No sound on errors
set mouse=a                 	" Enable mouse
set backspace=eol,start,indent 	" Set backspace config
set history=70              	" The lines of history VIM has to remember
set completeopt=menu,menuone,longest
set complete-=i					" Not to include headers?
set fillchars=vert:\|,fold:-
set formatoptions+=rnmMw
set guioptions+=eg
set guioptions-=l               " No left-hand scrollbar
set guioptions-=L               " No left-hand scrollbar always
set guioptions-=r               " No right-hand scrollbar
set guioptions-=R               " No right-hand scrollbar always
set guioptions-=b               " No bottom scrollbar
"set guioptions-=m               " No menubar
set guioptions-=T               " No toolbar(T)
set guioptions-=t               " Not include tearoff menu items.
set linespace=1
set nobackup                	" Don't back up file.
set undolevels=500
set updatetime=500				" Similar to auto save.
set virtualedit=block
set wildmenu					" Command line completion is enhanced.
set winaltkeys=no				" Disable ALT key for the GVIM application.
set hidden          	        "Make the buffer hidden, instead of unload
set whichwrap+=<,>,[,]			"Move the cursor to next or previous line.
set textwidth=80

" [Search configuration]
set ignorecase          		" Ignore case when searching
set smartcase           		" Case matches depend on what you type
set incsearch           		" Make search act like search in modern browsers
set magic               		" Use regular expressions for searching

" [Tab configuration]
set noswapfile
set shiftwidth=4        		" Number of space for indenting
set tabstop=4           		" Width of TAB
set expandtab           		" Insert space for TAB
set softtabstop=4
set smarttab
"set backupcopy=yes          	" Set the backup style as overwrite

" [spell checking]
set nospell						" No spell checking.
set spelllang=en  				" Language for spell checking.

" [Display configuration]
set splitright					" Put new splited window to the right of current.
set number              		" Display line number
set display=lastline,uhex
set ruler                		" Always show current position
set cmdheight=2          		" The commandbar height
set scrolloff=999               " min # of line above and below cursor
set showcmd              		" Show the command currently executing.
set showmode             		" Show which mode you are in
set showmatch            		" Show matching bracets when text indicator is over them
set nolazyredraw         		" Don't redraw while executing macros
"set linebreak
set wrap						" Wrap the text
set t_Co=256
set hlsearch                    " highlight search
colorscheme wombat256mod
"set colorcolumn=+1				" Highlight the (textwidth + 1)th column

" [Statusline]
set laststatus=2 				" Always show the statusline
set statusline=
set statusline+=[%n]\                            "buffer number
set statusline+=%<%f\                            "File+path
set statusline+=%=%{strftime('%I:%M')}\ \        "Current time
set statusline+=%y\ \                            "FileType
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''}  "Encoding
set statusline+=%{(&bomb?\",BOM\":\"\")}/        "Encoding2
set statusline+=%{&ff}\                          "FileFormat (dos/unix..)
set statusline+=\ row:%l/%L\ \                   "Rownumber/total (%)
set statusline+=col:%03c\                        "Colnr
set statusline+=\ %m%r%w\ %P\ \                  "Modified? Readonly? Top/bot.

" [Indent configuration]
set autoindent
set cindent

" [diff options]
set diffopt=filler,vertical

" [platform specific options]
if has("win32")
    set guifont=DejaVu_Sans_Mono:h10:cANSI
    set encoding=utf-8
    set fileencodings=ucs-bom,cp936,gb18030,utf-8,big5,iso-8859-1
elseif has("unix")
    set encoding=utf-8
    setglobal fenc=utf-8
    set termencoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,iso-8859-1
    set fileformats=unix,dos,mac
else
    set encoding=utf-8
endif

"-----------------------  End of Options ---------------------------

"                       Function Definiton:
"-------------------------------------------------------------------"
" Highlight the status line
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=#333333 ctermfg=6 guifg=Cyan ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

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

" [using google-chrome to open the current file in html format]
function! HtmlOpen()
    set nonumber
    TOhtml
    let s:command='!google-chrome ' . "\'" . expand(expand("%:p")) . "\'"
    exec s:command
endfunction

" [Make tags for C/C++ or Java]
function! MakeTags()
    if &filetype == 'java'
        exec ':silent '."!ctags --field=+ilaS -R --language-force=java ."
    elseif &filetype == 'c'
        exec ':silent '."!ctags -R --fields=+laS --c-kinds=-p --extra=q ."
    elseif &filetype == 'cpp'
        exec ':silent '."!ctags -R --fields=+ialS --c-kinds=-p --c++-kinds=-p --extra=q ."
    endif
endfunction

" [Remake tags for C/C++ or Java]
function! RemakeTags()
    exec ':silent '."!rm -f tags"
    call MakeTags()
endfunction

" [Let the same line combine together]
function! UniqueLine() range
    let l1 = a:firstline
    let l2 = a:lastline
    while l1<=l2
        call cursor(l1,1)
        let lineCount=0
        let lineData=getline(l1)
        if lineData==''
            execute l1." d"
            let l2-=1
        else
            let lineDataEsc=escape(lineData,'\\/.*$^~[]')
            while search('^'.lineDataEsc.'$','c',l2)>0
                execute "d"
                let l2-=1
                let lineCount+=1
            endwhile
            let lineData=lineCount."\t".lineData
            call append(l1-1,[lineData])
            let l2+=1
            let l1+=1
        endif
    endwhile
endfunction

" [Compile only one file]
func! Compile()
    exec ":w"
    "C program
    if &filetype == 'c'
        if has("win32")
            exec "!gcc -ansi -pedantic -Wl,-enable-auto-import % -g -o %<.exe"
        elseif has("unix")
            exec "!gcc -ansi -pedantic -Wall -lpthread -lm -g -o %:r %"
        endif

        "c++ program
    elseif &filetype == 'cpp'
        if has("win32")
            exec 'silent '."!g++ -Wl,-enable-auto-import % -g -o %<.exe"
        elseif has("unix")
            exec 'silent '."!g++ -Wall -g -o %:r %"
        endif
        "java program
    elseif &filetype == 'java'
        exec "!javac -d '.' % "
    endif
endfunc

" [Run only one file]
func! Run()
    if &filetype == 'c' || &filetype == 'cpp'
        if has("win32")
            exec "!%<.exe"
        elseif has("unix")
            exec "!./%:r"
        endif
    elseif &filetype == 'java'
        exec "!java %:r"
    endif
endfunc

function! BuildProject()
    if &filetype == 'java'
        exec "!javac %"
    elseif &filetype == 'c' || &filetype == 'cpp'
        exec "make -j4"
    endif
endfunc

" [Rebuild the project]
func! Rebuild()
    exec "make clean"
    call BuildProject()
endfunc

" [Run the project]
func! RunProject()
    if &filetype == 'java'
        exec "!java %:r"
    elseif &filetype == 'c' || &filetype =='cpp' || &filetype == 'cuda'
        "let s:command = '!./'. expand(expand("%:p:h:h:t"))
        let s:command = '!if [[ -f input ]]; then ./'. expand(expand("%:p:h:t")). ' < input; else ./' . expand(expand("%:p:h:t")). '; fi'
        exec s:command
    elseif &filetype == 'sh'
        exec "!chmod +x %;bash %"
    elseif &filetype == 'html'
        exec "!firefox %"
    elseif &filetype == 'dot'
        let s:command = '!dot -Tps % -o ' . expand(expand("%:r")) .'.ps'
        exec s:command
    endif
endfunc

" [convert file format from dos to unix]
func! Dos2Unix()
    exec "update"
    exec "e ++ff=dos"
    exec "setlocal ff=unix"
    exec "w"
endfunc

" [convert file format from unix to dos]
func! Unix2Dos()
    exec "update"
    exec "e ++ff=dos"
    exec "w"
endfunc

" [Format file using AStyle program]
function! AStyle()
    exec '!astyle --style=kr --break-blocks --pad-oper --pad-header --indent-labels --indent-switches --indent-preprocessor -Y --add-brackets --min-conditional-indent=0 --max-instatement-indent=60 --align-pointer=name --unpad-paren --align-reference=name --suffix=none --lineend=linux %'
endfunction

" [Update Last modified time stamp]
function! LastModified()
    if &modified
        let save_cursor = getpos(".")
        let n = min([30, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}Last Modified: \).*#\1' .
                    \ strftime('%c') . '#e'
        "keepjumps exe '1,' . n . 's#^\(.\{,10}@date \).*#\1' .
                    "\ strftime('%c') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun

" [Highlight column matching { } pattern]
let s:hlflag=0
function! ColumnHighlight()
    let c=getline(line('.'))[col('.') - 1]
    if c=='{' || c=='}'
        let &cc = s:cc_default . ',' . virtcol('.')
        let s:hlflag = 1
    else
        if s:hlflag == 1
            let &cc = s:cc_default
            let s:hlflag = 0
        endif
    endif
endfunction

" [Let the same line combine together]
function! UniqueLine() range
    let l1 = a:firstline
    let l2 = a:lastline
    while l1<=l2
        call cursor(l1,1)
        let lineCount=0
        let lineData=getline(l1)
        if lineData==''
            execute l1." d"
            let l2-=1
        else
            let lineDataEsc=escape(lineData,'\\/.*$^~[]')
            while search('^'.lineDataEsc.'$','c',l2)>0
                execute "d"
                let l2-=1
                let lineCount+=1
            endwhile
            let lineData=lineCount."\t".lineData
            call append(l1-1,[lineData])
            let l2+=1
            let l1+=1
        endif
    endwhile
endfunction

" [Java setup]
function! SetupJava()
    "set up Make for java
    autocmd BufRead *.java set errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
    autocmd BufRead *.java set makeprg=ant\ compile\ -find\ ../build.xml
endfunction
"-------------------------End of Function Definition--------------------"

"                           Auto Commands:
" ----------------------------------------------------------------
" [set up java]
call SetupJava()

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=#333333 guifg=White ctermbg=0 ctermfg=7

" [Set up autocommands]
if has("autocmd") && !exists("autocommands_loaded")
    let autocommands_loaded=1

    if version >= 703
        "autocmd CursorMoved *.h,*.c,*.cpp call ColumnHighlight()
    endif

    "autocmd BufReadPost * call DoAutoComplete()
    autocmd BufReadPost quickfix  setlocal nobuflisted
    autocmd BufWinLeave * call RemoveTrailingWhitespace()

    " set the indent for lisp"
    autocmd filetype lisp,scheme,art setlocal equalprg=lispindent.lisp

    highlight OverLength ctermbg=darkred guibg=#FFD9D9
    autocmd filetype c,cpp match OverLength /\%81v.\+/

    " set the filetype syntax for mutt config files"
    autocmd BufNewFile,BufRead *.muttrc set filetype=muttrc

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif
" ------------------------ end of auto command --------------------------

" 						General Maping Keys:
" -----------------------------------------------------------------------
" [Copy and cut in visual mode; Paste in insert mode]
inoremap    <c-v>   <c-o>:set paste<cr><c-r>+<c-o>:set nopaste<cr>
xnoremap    <c-c>   "+y
xnoremap    <c-x>   "+x

" [Select all]
nnoremap    <c-a>   ggVG

" [Scroll up and down in Quickfix]
nnoremap    <c-n>   :cn<cr>
nnoremap    <c-p>   :cp<cr>

" [Basically you press * or # to search for the current selection !! Really useful]
vnoremap    <silent> *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap    <silent> #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" [CTRL-hjkl to browse command history and move the cursor]
cnoremap    <c-k>   <up>
cnoremap    <c-j>   <down>
cnoremap    <c-h>   <left>
cnoremap    <c-l>   <right>

" [CTRL-hjkl to move the cursor in insert mode]
inoremap    <m-k>   <c-k>
inoremap    <c-k>   <up>
inoremap    <c-j>   <down>
inoremap    <c-h>   <esc>I
inoremap    <c-l>   <esc>A
inoremap    <c-o>   <esc>o

" [Easy indent in visual mode]
xnoremap    <   <gv
xnoremap    >   >gv

" [Search and Complete]
"cnoremap    <m-n>   <cr>/<c-r>=histget('/',-1)<cr>
cnoremap    <m-i>   <c-r>=tolower(substitute(getline('.')[(col('.')-1):],'\W.*','','g'))<cr>

" [Quick write and quit]
imap        jj <esc>:w<cr>a
nnoremap    <leader>ww   :wqa!<cr>
nnoremap    <leader>qq   :qa!<cr>

" [Diff mode maps]
nnoremap    du      :diffupdate<cr>
xnoremap    <m-o>   :diffget<cr>
xnoremap    <m-p>   :diffput<cr>

" [Up down move]
nnoremap    j       gj
nnoremap    k       gk
nnoremap    gj      j
nnoremap    gk      k

" [Misc]
nnoremap    J       gJ
nnoremap    gJ      J
nnoremap    -       _
nnoremap    _       -

" [Smart way to move btw. windows]
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" [Use the arrows to switch between buffers]
nmap <tab> :bn<cr>
nmap <S-tab> :bp<cr>

" no Highlight search"
nmap <leader><cr> :nohlsearch<cr>

" [switch to the directory of the open buffer]
map <leader>cd :cd %:p:h<cr>

" [complete close curly brace]
inoremap {<cr> {<cr>}<c-[>ko

" [Compile Run Debug]
"nmap <S-M> :make<cr>
nmap <S-M> :call BuildProject()<cr>
nmap <S-F7> :call Rebuild()<cr>
nmap <C-S-F7> : call Compile()<cr>
nmap <S-R> :call RunProject()<cr>
nmap <C-S-F5> : call Run()<cr>

" [Spell checking]"
map <leader>se :setlocal spell spelllang=en_us<cr>
map <leader>sn :setlocal nospell<cr>
"au BufNewFile *.txt put!='Last Modified: '

" [markdown]"
nmap <leader>md :%!markdown2 --html4tags % > "%:r".html<cr>:r<cr>kdd

nmap <F6> :!qmake -project; qmake; make<cr>

" fullscreen
noremap <silent> <F11> :exe "!wmctrl -r ".v:servername." -b toggle,fullscreen"<cr>

" exit to normal mode
imap kk <esc>
"--------------------- end of general key mapings ------------------------

" 						Plugins Configuration:

" ----------------------------------------------------------------
"							[A]
" ----------------------------------------------------------------
nnoremap <silent> <F4> :A<CR>


" ----------------------------------------------------------------
"                       [Doxygen highling]
" ----------------------------------------------------------------
au BufNewFile,BufRead *.doxygen setfiletype doxygen
let g:doxygen_enhanced_color=0
let g:doxygen_my_rendering=0
let g:doxygen_javadoc_autobrief=1
let g:doxygen_end_punctuation='[.]'
let g:doxygenErrorComment=0
let g:doxygenLinkError=0
let g:DoxygenToolkit_authorName="Stanley Rice (Conghui He)"
map <F9> :Dox<cr>
imap <F9> <Esc>:Dox<cr>

" ----------------------------------------------------------------
"                           [TagBar]
" ----------------------------------------------------------------
nmap <leader>tb :TagbarToggle<cr>
let g:tagbar_left=0

" ----------------------------------------------------------------
"                           [NERDTree]
" ----------------------------------------------------------------
let NERDTreeShowBookmarks=0     "Display the bookmark table.
let NERDTreeQuitOnOpen=0        "Whether to close after opening a file.
let NERDTreeMouseMode=3         "Single click to open any node.
let NERDTreeCaseSensitiveSort=0 "Sort the files case insensitive.
let NERDTreeWinSize = 31        "Default is 31
let NERDTreeDirArrows = 1       "Show arrows
let NERDTreeCasadeOpenSingleChildDir=1

" Ignore the following files
let NERDTreeIgnore  = ['\.o$[[file]]']
let NERDTreeIgnore += ['\.class$[[file]]']
let NERDTreeIgnore += ['^moc_[[file]]', '^ui_[[file]]', '\.ui$[[file]]']
let NERDTreeIgnore += ['\qrc_[[file]]', '\.qrc$[[file]]']
let NERDTreeIgnore += ['\.user[[file]]']
let NERDTreeSortOrder=['\/$', '\.h$','\.c$', '\.cpp$', '*', '\.pro$']
"let NERDTreeIgnore += ['\(\.cpp\)\@<!$[[file]]'] "this will filter all files except .cpp

"Do some key mapings
nmap <leader>wm :NERDTreeToggle<cr> "map the key

" ----------------------------------------------------------------
"                           [MiniBuffer]
" ----------------------------------------------------------------
let g:miniBufExplTabWrap = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMaxSize = 2
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

" ----------------------------------------------------------------
"                           [Grep]
" ----------------------------------------------------------------
nnoremap <silent> <F3> :Grep<cr><cr><cr>

" ----------------------------------------------------------------
"							[NeoComplCache]
" ----------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1

"kmax
"let g:SuperTabDefaultCompletionType = '<C-X><C-U>'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"

" ----------------------------------------------------------------
"							[clang-complete]
" ----------------------------------------------------------------
let g:clang_complete_copen = 0
let g:clang_snippets = 1
let g:clang_snippets_engine = 'snipmate'
let g:clang_trailing_placeholder = 1
let g:clang_complete_macros = 1

" ----------------------------------------------------------------
"							[syntatic]
" ----------------------------------------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 0

"							User Define Commands:
"------------------------------------------------------------------
command! 	Compile 			call Compile()
command! 	Rebuild				call Rebuild()
command!	RunOne				call Run()
command!	Run					call RunProject()
command!	AStyle				call AStyle()
command!	VIMRC				tabedit	$HOME/.vimrc
command!    RemakeTags          call RemakeTags()
command!    Html                call HtmlOpen()
"--------------------End of User Define Commands ------------------

" 								Menus:
"------------------------------------------------------------------
menu        &Misc.Build.Make                        :Make<cr>
menu        &Misc.Build.Rebuild                     :Rebuild<cr>
menu        &Misc.Build.Run\ Project                :Run<cr>
menu        &Misc.Build.Compile\ One                :Compile<cr>
menu        &Misc.Build.Run\ One                    :RunOne<cr>
menu        &Misc.Add\ Define\ Guard                :AddDefineGuard<cr>
menu        &Misc.Astyle\ Format                    :AStyle<cr>
menu        &Misc.Vimrc.Edit\ Vimrc                 :VIMRC<cr>
menu        &Misc.Vimrc.Reload\ Vimrc               :so ~/.vimrc<cr>
menu        &Plugin.Tab\ Bar                        :TagbarToggle<cr>
"--------------------------End of Menus ----------------------------

" :LoadTemplate       根据文件后缀自动加载模板
let g:template_path='D:/Apps/Gvim/vimfiles/template/'

"                               AutoInfoDetect:
"--------------------------------------------------------------------
" 自动添加作者、时间等信息，本质是NERD_commenter && authorinfo的结合
let g:vimrc_author='Kmax'
let g:vimrc_email='zenglingzheng@gmail.com'
let g:vimrc_homepage='http://www.gokmax.com'
" Ctrl + E            一步加载语法模板和作者、时间信息
map <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
imap <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
vmap <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
"---------------------------End of AutoInfoDetect --------------------

"TxtBrowser          高亮TXT文本文件
au BufRead,BufNewFile *.txt setlocal ft=txt




" ======= 引号 && 括号自动匹配 ======= "
 :inoremap ( ()<ESC>i
" :inoremap ) <c-r>=ClosePair(')')<CR>
 :inoremap { {}<ESC>i
" :inoremap } <c-r>=ClosePair('}')<CR>
 :inoremap [ []<ESC>i
" :inoremap ] <c-r>=ClosePair(']')<CR>
" :inoremap < <><ESC>i   < is usually used in comparing
" :inoremap > <c-r>=ClosePair('>')<CR>
 :inoremap " ""<ESC>i
 :inoremap ' ''<ESC>i
 :inoremap ` ``<ESC>i
 


" Vim color file
"  Maintainer: Tiza
" Last Change: 2002/10/25 Fri 16:23.
"     version: 1.2
" This color scheme uses a dark background.
set background=dark
hi clear
if exists("syntax_on")
   syntax reset
   endif

   let colors_name = "neon"

   hi Normal       guifg=#f0f0f0 guibg=#303030

   " Search
   hi IncSearch    gui=UNDERLINE guifg=#80ffff guibg=#0060c0
   hi Search       gui=NONE guifg=#ffffa8 guibg=#808000
   " hi Search       gui=NONE guifg=#b0ffb0 guibg=#008000

   " Messages
   hi ErrorMsg     gui=BOLD guifg=#ffa0ff guibg=NONE
   hi WarningMsg   gui=BOLD guifg=#ffa0ff guibg=NONE
   hi ModeMsg      gui=BOLD guifg=#a0d0ff guibg=NONE
   hi MoreMsg      gui=BOLD guifg=#70ffc0 guibg=#8040ff
   hi Question     gui=BOLD guifg=#e8e800 guibg=NONE

   " Split area
   hi StatusLine   gui=NONE guifg=#000000 guibg=#c4c4c4
   hi StatusLineNC gui=NONE guifg=#707070 guibg=#c4c4c4
   hi VertSplit    gui=NONE guifg=#707070 guibg=#c4c4c4
   hi WildMenu     gui=NONE guifg=#000000 guibg=#ff80c0

   " Diff
   hi DiffText     gui=NONE guifg=#ff78f0 guibg=#a02860
   hi DiffChange   gui=NONE guifg=#e03870 guibg=#601830
   hi DiffDelete   gui=NONE guifg=#a0d0ff guibg=#0020a0
   hi DiffAdd      gui=NONE guifg=#a0d0ff guibg=#0020a0

   " Cursor
   hi Cursor       gui=NONE guifg=#70ffc0 guibg=#8040ff
   hi lCursor      gui=NONE guifg=#ffffff guibg=#8800ff
   hi CursorIM     gui=NONE guifg=#ffffff guibg=#8800ff

   " Fold
   hi Folded       gui=NONE guifg=#40f0f0 guibg=#006090
   hi FoldColumn   gui=NONE guifg=#40c0ff guibg=#404040

   " Other
   hi Directory    gui=NONE guifg=#c8c8ff guibg=NONE
   hi LineNr       gui=NONE guifg=#707070 guibg=NONE
   hi NonText      gui=BOLD guifg=#d84070 guibg=#383838
   hi SpecialKey   gui=BOLD guifg=#8888ff guibg=NONE
   hi Title        gui=BOLD guifg=fg      guibg=NONE
   hi Visual       gui=NONE guifg=#b0ffb0 guibg=#008000
   hi VisualNOS    gui=NONE guifg=#ffe8c8 guibg=#c06800

   " Syntax group
   hi Comment      gui=NONE guifg=#c0c0c0 guibg=NONE
   hi Constant     gui=NONE guifg=#92d4ff guibg=NONE
   hi Error        gui=BOLD guifg=#ffffff guibg=#8000ff
   hi Identifier   gui=NONE guifg=#40f8f8 guibg=NONE
   hi Ignore       gui=NONE guifg=bg      guibg=NONE
   hi PreProc      gui=NONE guifg=#ffa8ff guibg=NONE
   hi Special      gui=NONE guifg=#ffc890 guibg=NONE
   hi Statement    gui=NONE guifg=#dcdc78 guibg=NONE
   hi Todo         gui=BOLD,UNDERLINE guifg=#ff80d0 guibg=NONE
   hi Type         gui=NONE guifg=#60f0a8 guibg=NONE
   hi Underlined   gui=UNDERLINE guifg=fg guibg=NONE

