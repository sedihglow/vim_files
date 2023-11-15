" This vimrc is what gets called when opening vim. (~/.vimrc)

" TODO: Dont make the paths direct if possible, or if they are not found in
" the standard location ~/.vim/... doing this is low prio and a bit of a maybe
" after thinking about it.

" set general/initial set command settings
source ~/.vim/vimrc_files/.dflt_set_cmds_vimrc.vim
call Set_init_defaults()

" set syntax highlighting settings
source ~/.vim/vimrc_files/.syn_hi_vimrc.vim

" set the packadd pluggins and runtime file commands defaults
source ~/.vim/vimrc_files/.packadd_includes.vim

"To enable file type detection
filetype on
autocmd FileType c,cpp,python,text,make
	\ autocmd BufWritePre <buffer> %s/\s\+$//e

augroup Gen_txt_style_Settings
	" text filetype covers: *.text,README,LICENSE,COPYING,AUTHORS
    autocmd FileType text call Set_txt_defaults()
augroup END

augroup C_PYTHON_Settings
    "the command below execute the script for the specific filetype C
    autocmd FileType c call Set_c_defaults()

    "the command below execute the script for the specific filetype python
    autocmd FileType python call Set_python_defaults()
augroup END

augroup Makefile_Settings
	" Sets specific. Covers: Makefile, makefile
    autocmd FileType make call Set_make_defaults()
augroup END

"source ~/.vim/vimrc_files/func_inc.vim

"source ~/git_repos/vim_files/scripts_vim/function_files/precedence_table.vim

"source
"	\ ~/git_repos/vim_files/scripts_vim/function_files/vim9/dev/v9_trans_win.vim

source ~/git_repos/vim_files/scripts_vim/function_files/trans_win.vim
source ~/git_repos/vim_files/scripts_vim/function_files/cursor_higroup.vim

call Transparent_toggle()
