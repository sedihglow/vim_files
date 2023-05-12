" This vimrc is what gets called when opening vim. (~/.vimrc)

" set syntax highlighting settings
source ./syn_hi.vim

" set general/initial set command settings
source ./dflt_set_cmds.vim

"To enable file type detection"
filetype on
autocmd FileType c,cpp,python,text autocmd BufWritePre <buffer> %s/\s\+$//e

augroup Gen_txt_style_Settings
	" text filetype covers: *.text,README,LICENSE,COPYING,AUTHORS
    autocmd FileType text source ~/vimrc/.txt_vimrc.vim
augroup END

augroup C_PYTHON_Settings
    "the command below execute the script for the specific filetype C
    autocmd FileType c source ~/vimrc/.c_vimrc.vim

    "the command below execute the script for the specific filetype python
    autocmd FileType python source ~/vimrc/.py_vimrc.vim
augroup END

augroup Makefile_Settings
	" Sets specific. Covers: Makefile, makefile
    autocmd FileType make source ~/vimrc/.makefile_vimrc.vim
augroup END

source ../scripts_vim/funct_inc.vim
