" This vimrc is what gets called when opening vim. (~/.vimrc)
" This vimrc is for the test_tree legacy testing

" set syntax highlighting settings
source ~/.vim/vimrc_files/.syn_hi_vimrc.vim

" set general/initial set command settings
source ~/.vim/vimrc_files/.dflt_set_cmds_vimrc.vim

"To enable file type detection"
filetype on
autocmd FileType c,cpp,python,text,make
	\ autocmd BufWritePre <buffer> %s/\s\+$//e

augroup Gen_txt_style_Settings
	" text filetype covers: *.text,README,LICENSE,COPYING,AUTHORS
    autocmd FileType text source ~/.vim/vimrc_files/.txt_vimrc.vim
augroup END

augroup C_PYTHON_Settings
    "the command below execute the script for the specific filetype C
    autocmd FileType c source ~/.vim/vimrc_files/.c_vimrc.vim

    "the command below execute the script for the specific filetype python
    autocmd FileType python source ~/.vim/vimrc_files/.py_vimrc.vim
augroup END

augroup Makefile_Settings
	" Sets specific. Covers: Makefile, makefile
    autocmd FileType make source ~/.vim/vimrc_files/.makefile_vimrc.vim
augroup END

source ~/.vim/vimrc_files/func_inc.vim
