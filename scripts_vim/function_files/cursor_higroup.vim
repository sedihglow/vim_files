function! Cursor_higroup_nameid()
	let cur_synid_t = synID(line("."), col("."), 1)
	let cur_synid_f = synID(line("."), col("."), 0)

	echo "true synid arg : " synIDattr(cur_synid_t, "name")
	echo "false synid arg: " synIDattr(cur_synid_f, "name")

	" echo synIDattr(synIDtrans(cur_synid_t), "name")
	"echo synIDattr(synIDtrans(), "name")
	"echo synIDattr(synIDtrans(), "name")
endfunction
