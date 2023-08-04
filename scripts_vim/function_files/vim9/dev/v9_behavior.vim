vim9script

def V9_test_start_num()
  var save_cursor = getcurpos()
  var buf: number = bufnr('%')

  var start: number = search('\*highlight-groups\*', 'c')
  var end: number = search('^======')
  for lnum in range(start, end)
    var word: string = getline(lnum)->matchstr('^\w\+\ze\t')
    if word->hlexists()
      var type = 'help-hl-' .. word
      if prop_type_list({bufnr: buf})->index(type) != -1
	# was called before, delete existing properties
	prop_remove({type: type, bufnr: buf})
	prop_type_delete(type, {bufnr: buf})
      endif
      prop_type_add(type, {
	bufnr: buf,
	highlight: word,
	combine: false,
	})
      prop_add(lnum, 1, {length: word->strlen(), type: type})
    endif
  endfor

  setpos('.', save_cursor)
enddef
defcompile

def V9_test_final(): void
	final int_list = [1, 2]
	final float_list = [20.31, 21.50]
	final char_list = ['c', 'd']
	final string_list = ["first", "second"]

	echo "\t---- initial values of each list ----\n"
		 .. "int_list	 = " int_list
		 .. "float_list  = " float_list
		 .. "char_list   = " char_list
		 .. "string_list = " string_list


	echo "\t---- starting testing ---"
	
	"let int_list	= [10, 11]	# Error!
	let float_list[0] = 9.9	# OK
	let char_list->add('n')	# OK

	echo "-- Changes that should have occured"
		 .. "let int_list	= [10, 11]	# Error!"
		 .. "let float_list[0] = 9.9	# OK"
		 .. "let char_list->add('n')	# OK"

	echo "--- Results of last changes ---"
		 .. "int_list  : " int_list
         .. "float_list: " float_list
         .. "char_list : " char_list
enddef
