" The toggle transparent function 

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

let s:prev_cterm_bg = {}

" TODO: Function to add/remove a group name to the trans_hi_groups

function! Test_empty()
		let spkey = "SpecialKey"
		let hi_group_id = hlID(spkey)
		let s:prev_cterm_bg[spkey] = synIDattr(synIDtrans(spkey),"bg")

		if s:prev_cterm_bg[spkey] == "" 
			echo "empty string found"
		else
			echo "--- no empty string: printing the result ---"
			echo s:prev_cterm_bg[spkey]
		endif

endfunction

" for transparent background
function! Dev_transparent()
	"go through highlight groups
	for hi_group in s:hi_group_names
		let hi_group_id = hlID(hi_group)
		let s:prev_cterm_bg[hi_group] = synIDattr(synIDtrans(hi_group_id),"bg")
		execute "highlight" hi_group  "ctermbg=none"
	endfor
endfunction
" autocmd ColorScheme * call AdaptColorscheme()

function! Switch_back()
	set cursorline

	for hi_group in s:hi_group_names
	

		" If the resulting bg is non-existant a empty string is returned.
		" If an empty string is found, replace it with "none" to use in an
		" exec command
		if s:prev_cterm_bg[hi_group] == "" 
			s:prev_cterm_bg[hi_group] = "none"
		endif


endfunction

" Save the highlight group settings that get changed in Switch_transparent()
" - unlikely: save to a file and read the file back when we go back and forth
" - likely: Build a dictionary using synIDattr and return it to be used to set
"	the values later.
" - kinda likely: Build a list which contains values for arguments based on its 
"	index. This would include empty strings which are returned when a option is
"	not set or available for a given hilight group.
" - just do both :D

" This needs to turn into something better but for now just throwing the shit
" in.
function! Store_hi_settings()

endfunction
	
" Allows the ability to toggle transparency (no gvim currently)
let g:is_trans = 1
function! Toggle_transparent()
	if g:is_trans == 0
		" Sets term vim to transparent
		call Switch_transparent()
		" save the changed groups values.

		let g:is_trans = 1
	else
		" Sets term vim to opaque
		hi Normal ctermbg=black
		let g:is_trans = 0
	endif
endfunction
" nnoremap <C-t> : call Toggle_transparent()<CR>

function! Transparent_in_testing()
	highlight Normal guibg=NONE ctermbg=NONE
	highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
	highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
	highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
	"highlight clear LineNr
	"highlight clear SignColumn
	highlight clear StatusLine

	" Change Color when entering Insert Mode
	autocmd InsertEnter * set nocursorline

	" Revert Color to default when leaving Insert Mode
	autocmd InsertLeave * set nocursorline

	" extra settings, uncomment them if necessary :) 
	"set cursorline
	"set noshowmode
	"set nocursorline

	" trasparent end
endfunction
