" AutoAlign: ftplugin support for vim
" Author:    Charles E. Campbell, Jr.
" Date:      Aug 16, 2007
" Version:   13
" ---------------------------------------------------------------------
let b:loaded_autoalign_vim = "v13"

"  overloading '=' to keep things lined up {{{1
"ino <silent> = =<c-o>:silent call AutoAlign(1)<cr>
ino <silent> = =<c-r>=AutoAlign(1)<cr>
let b:autoalign_reqdpat1 = '^\s*let\>.*='
let b:autoalign_notpat1  = '^[^=]\+$'
let b:autoalign_trigger1 = '='
if !exists("g:mapleader")
 let b:autoalign_cmd1     = 'norm \t=$'
else
 let b:autoalign_cmd1     = "norm ".g:mapleader."t=$"
endif
