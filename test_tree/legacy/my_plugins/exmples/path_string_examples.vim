" This script is here to demonstrate the behavior of vim and its current
" working directory while going through the vimrc. It will show ways to obtain a
" path string utilizing functions like expand, glob, resolve, split.
" 
" This came to interest from having my .vimrc source a symlink to the actual
" .vim script located elsewhere in its git repo directory. I needed to obtain
" the path of a folder in the repo, not where the symlink is recorded. So in the
" linked.vim script going into the repo's directory required obtaining a path.
" 
" I discovered pwd was sitting at ~/.vim/ where the linked.vim resided instead of
" the physical path in ~/myrepo/linked.vim.
" 
" Using the test_tree directory in this repo we can demonstrate the behavior and
" ways to obtain paths, including how it works with a symlink.

let res_ex_script = resolve(expand("<script>"))
let res_ex_p = resolve(expand("<script>:p"))
let res_ex_h = resolve(expand("<script>:h"))
let res_ex_ph = resolve(expand("<script>:p:h"))

let ex_script = expand("<script>")
let ex_p  = expand("<script>:p")
let ex_h = expand("<script>:h")
let ex_ph = expand("<script>:p:h")

let gl_fr_home  =
	\ glob('~/git_repos/vim_files/test_tree/legacy/my_plugins/scripts/*.vim')

let gl_fr_link = glob('~/git_repos/vim_files/test_tree/legacy/')

let gl_fr_link = glob('~/.vim/vimrc_files/*.vim')
" let final_split = split(glob(resolve(expand("<script>")) .. "/function_files/"), "\n")
" let final_split = split(glob(resolve("~/.vim/vimrc_files/func_inc.vim/")), "\n")
" let final_split = split(glob(resolve("~/.vim/vimrc_files/func_inc.vim/")), "\n")

echo "--- printouts of stuff resolving and expanding and things ---\n"
	\ "ex(script)          -> "  ex_script     "\n"
	\ "res(ex(script))     -> "  res_ex_script "\n"
	\ "ex(script:p)        -> "  ex_p          "\n"
	\ "res(ex(script:p))   -> "  res_ex_p      "\n"
	\ "ex(script:h)        -> "  ex_h          "\n"
	\ "res(ex(script:h))   -> "  res_ex_h      "\n"
	\ "ex(script:p:h)      -> "  ex_ph         "\n"
	\ "res(ex(script:p:h)) -> "  res_ex_ph     "\n"
	\ "gl_rep              -> "  gl_rep        "\n"
	\ "gl_home             -> "  gl_home       "\n"

" echo "before for"
" for i in final_split
" 	echo "loop exec"
" 	echo i
" endfor
