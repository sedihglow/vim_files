" Legacy vimscript
" TODO: get vim to do my headers

" TODO: This still has work before its a good example beyond if == ''
function! Test_hi_empty_string()
	let s:hi_group_names = [
							\ "Normal"	  ,
							\ "LineNr"	  ,
							\ "Folded"	  ,
							\ "NonText"	  ,
							\ "SpecialKey",
							\ "VertSplit" ,
							\ "SignColumn",
							\ "FoldColumn"
						 \ ]
	
	let emptykey = "SpecialKey" " Highlightings may vary, use a ctermxx=none

	let gid = hlID(emptykey)

	" Testing with dict because thats how i got to writing a empty string
	" example. 
	let cterm_bg = {}
	let cterm_bg[emptykey] = synIDattr(synIDtrans(),"bg")

	if cterm_bg[emptykey] == "" 
		echo "empty string found"
	else
		echo "--- no empty string: printing the result ---"
		echo s:prev_cterm_bg[emptykey]
	endif
endfunction


" Wrapper to call functions that i use to play with set commands and their
" functionality
function! Set_testing(command)
	if (command == "comment")

	endif

endfunction

function! Test_final()
	final int_list = [1, 2]
	final float_list = [20.31, 21.50]
	final char_list = ['c', 'd']
	final string_list = ["first", "second"]

	echo "\t---- initial values of each list ----\n"
	\	 "int_list	  = " int_list
	\	 "float_list  = " float_list
	\	 "char_list   = " char_list
	\	 "string_list = " string_list


	echo "\t---- starting testing ---"
	
	"let int_list	= [10, 11]	# Error!
	let float_list[0] = 9.9	# OK
	let char_list->add('n')	# OK

	echo "-- Changes that should have occured"
	\	 "let int_list	= [10, 11]	# Error!"
	\	 "let float_list[0] = 9.9	# OK"
	\	 "let char_list->add('n')	# OK"

	echo "--- Results of last changes ---"
	\	 "int_list  : " int_list
    \    "float_list: " float_list
    \    "char_list : " char_list

endfunction
