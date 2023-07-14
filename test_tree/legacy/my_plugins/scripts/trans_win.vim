" The toggle transparent function 

" Allows the ability to toggle transparency (no gvim currently)
let g:is_trans = 1 " Starts as transparent since setting that by default
function! Toggle_transparent()
	if g:is_trans == 0
		" Sets term vim to transparent
		hi Normal ctermbg=NONE
		let g:is_trans = 1
	else
		" Sets term vim to opaque
		hi Normal ctermbg=black
		let g:is_trans = 0
	endif
endfunction
"nnoremap <C-t> : call Toggle_transparent()<CR>

" for transparent background
function! AdaptColorscheme()
   highlight clear CursorLine
   highlight Normal ctermbg=none
   highlight LineNr ctermbg=none
   highlight Folded ctermbg=none
   highlight NonText ctermbg=none
   highlight SpecialKey ctermbg=none
   highlight VertSplit ctermbg=none
   highlight SignColumn ctermbg=none
endfunction
autocmd ColorScheme * call AdaptColorscheme()

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
