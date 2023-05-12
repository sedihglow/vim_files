" Allows the ability to toggle transparency (no gvim currently)
let t:is_trans = 1 " Starts as transparent since setting that by default
function! Toggle_transparent()
	if t:is_trans == 0
		" Sets term vim to transparent
		hi Normal ctermbg=NONE
		let t:is_trans = 1
	else
		" Sets term vim to opaque
		hi Normal guibg=#111111 ctermbg=black
		"set background=dark
		let t:is_trans = 0
	endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>


