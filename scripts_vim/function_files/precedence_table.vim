" Generate a table for syntax keywords in vim

" TODO: 
" - Check its validity. Somehow this information isnt just out there neatly
"   already.
" - This can be improved with better functions
" - eventually gotta write it in vim9 too ^_^

function! Create_precedence_table()
	let precedence = {}
	let operators = split(join(['&&', '||', '!',
				 \				'==', '!=', '<', '<=', '>', '>=',
				 \				'+', '-', '*', '/', '%',
				 \				'^', '~',
				 \				'(', ')', '[]', '{}', '<>',
				 \				]), '\s')

	let norm_listy= ['&&', '||', '!',
				 \	 '==', '!=', '<', '<=', '>', '>=',
				 \	 '+', '-', '*', '/', '%',
				 \	 '^', '~',
				 \	 '(', ')', '[]', '{}', '<>',
				 \	]), '\s')

	echo "Echoing the operators from the scripty script"
	echo operators
endfunction




