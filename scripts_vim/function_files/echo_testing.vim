" This is just looking into playing around with findfile() and eventually
function! Echo_ff()
	echo "pre find file"
	let results=findfile("./dev/dev_transparent.vim", ".;")

	if results == "" 
		echo "empty string found"
	endif

	echo "result ---> 'results' <----" results
endfunction

