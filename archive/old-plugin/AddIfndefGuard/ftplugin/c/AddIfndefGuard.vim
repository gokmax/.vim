" A script to automatically insert the correct #ifndef/#define/#endif guards
" for a C/C++ header file.
"
" If the file has yet to be saved (and hence has no filename), nothing will
" happen.
"
" Some examples of what this script will do:
" 
" filename: SFGameState.h
" Inserted at top of file: #ifndef SFGAMESTATE_H
"                          #define SFGAMESTATE_H
" Inserted at bottom of file: #endif
"
" filename: SFGAMESTATE.cpp
" Inserted at top of file: #ifndef SFGAMESTATE_H
"                          #define SFGAMESTATE_H
" Inserted at bottom of file: #endif
" NOTE: It doesn't check to see if the current file ends with a .h
"
" NOTE: It doesn't yet check to see if there already is a
" #ifndef/#define/endif sequence. Make sure to not call this more than one per
" file. There is no way to automatically remove the added text, it can only be
" removed by hand.
"
" 
" This script is in the public domain.
"
" Last Update: Saturday, 19th Febuary 2005
" Maintainer: Rory McCann <ebelular at gmail dot com>


function! AddIfndefGuard()

	let s:uppercase_filename = toupper(expand("%:t:r"))

	" The current file might not have been saved, hence it wouldn't have a
	" filename. In this case s:uppercase_filename would be empty. The
	" function will only do stuff if uppercase_filename is nonempty

	if strlen(s:uppercase_filename) != 0
		
		let s:header_guard = s:uppercase_filename . "_H"

		echo s:header_guard

		" It's possible the user has already created ifndef guard code
		" (or called this function on this file), so we need to check
		" for that... in a later version. >:)
		
		" Add the text to the start and end of the file.

		call append(0, "#ifndef ".s:header_guard)
		call append(1, "#define ".s:header_guard)

		let s:last_line = line('$')

		call append(s:last_line, "#endif")

	endif

endfunction
