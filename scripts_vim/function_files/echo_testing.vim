
function! Echo_ff()
	echo "pre find file"
	let results=findfile("tags.vim", ".;")
	"echo "result ---> 'results' <----" &results
endfunction

