" This file will source all the functions written for vim found in the
" function_files/ directory. This file can be sourced and maintained so
" it is all compiled and called by ~/.vimrc in one place.

" TODO: Once we include more than one function file, see if using * works with
"		the source call so it can just be a one liner instead of many lines of
"		sourcing files. ^_^;
source ./function_files/auto_dir.vim
