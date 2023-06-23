" This vimrc is what gets called when opening vim. (~/.vimrc)

" set syntax highlighting settings
source ./.syn_hi_vimrc.vim

" set general/initial set command settings
source ./.dflt_set_cmds_vimrc.vim

"To enable file type detection"
filetype on
autocmd FileType c,cpp,python,text,make
	\ autocmd BufWritePre <buffer> %s/\s\+$//e

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


source ~/git_repos/vim_files/scripts_vim/function_files/echo_testing.vim


" source ../scripts_vim/funct_inc.vim
