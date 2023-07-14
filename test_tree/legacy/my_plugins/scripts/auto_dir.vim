" NOTE ON REFS: It appears IBM, soon after i read the articles, made them
" not accessable anymore? It autodirects to a main page for linux. On the
" websites search you can find links as if they exist or are archived but
" even going to them via IBM's website's search links they redirect.
" I am leaving the links in case they return or just for reference that it was
" from an IBM artcile. 
" TODO: 
"	 Perhaps they are reposted somewhere.
"	 Internet archive site time machine dealios will probably have it,
"	 If i look into it ill add that link here.
"
" Function originally pulled from:
" ref: https://developer.ibm.com/tutorials/l-vim-script-5
"      /#conjuring-directories-more-carefully
"	- Link works with or without second line included in the url
"	- Function originally pulled from section second line references of url
augroup AutoMkdir
	" *! called at start of augroups to ensure its cleared before 
	" assigning again if run twice. It doesnt overwrite but creates a new
	" handler otherwise. 
	" ref: https://developer.ibm.com/tutorials/l-vim-script-5
	"	   /#autocommand-groups
    autocmd! 
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

function! EnsureDirExists ()
	" required_dir: 
	" refs:	-- VIM_CMD --
	"		:h cmdline-special
	"		:h filename_modifiers
	"		:h expand
	" Notes:
	"	- Gets set to the 'head' of the current file path - pulled from expand call
	"
	"	- expand() call uses filename modifiers in its argument.
	"	
	"
	"
	"
    let required_dir = expand("%:h") 

    if !isdirectory(required_dir)
        call AskQuit("Directory '" . required_dir . "' doesn't exist.", "&Create it?")

        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'", "&Continue anyway?")
        endtry
    endif
endfunction

function! AskQuit (msg, proposed_action)
    if confirm(a:msg, "&Quit?\n" . a:proposed_action) == 1
        exit
    endif
endfunction

