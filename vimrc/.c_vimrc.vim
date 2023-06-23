" Vim color file -- askapachecode
" Maintainer: AskApache <webmaster@askapache.com>
" Updated: Wed Feb 22 14:10:54 2012 by galileo@galileo

"set background=dark

"set backup
"set backupcopy=auto
"set expandtab
set noexpandtab
set formatoptions=cro
set noerrorbells visualbell t_vb= "Disable ALL bells, Just making sure :)
set tabstop=8
set softtabstop=8
set shiftwidth=8
set switchbuf=usetab
" TODO: look into commentstring. First thought would be lang dependant but dont
"		know about it. Feels tho # is the comment syntax and %s is just string
"		after the # (aka the comment)
set commentstring=#%s 

" TODO: Find out if i need this line or if it was just a copy and redundant.
"		First glance feels redundant.
filetype on
autocmd FileType c,cpp,python autocmd BufWritePre <buffer> %s/\s\+$//e

" Syntastic stuff trying to ignore not being able to track down headers in
" different directories/non standard.
" TODO: Find a way to show it how to find a ./include/*.h path so it can
"		do the syntax checking instead of crapping out
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_check_header = 0
let g:syntastic_no_include_search = 1
let g:syntastic_remove_include_errors = 1
