function! Cursor_higroup_nameid()
	let cur_synid_t = synID(line("."), col("."), 1)
	let cur_synid_f = synID(line("."), col("."), 0)
	let cur_synid = synID(line("."), col("."), 1)

	echo "true synid arg : " synIDattr(cur_synid_t, "name")
	echo "false synid arg: " synIDattr(cur_synid_f, "name")

	echo "--- fg: " synIDattr(synIDtrans(cur_synid), "fg")
	"echo synIDattr(synIDtrans(), "name")
	"echo synIDattr(synIDtrans(), "name")
endfunction
