" Vim color file -- askapachecode
" Maintainer: AskApache <webmaster@askapache.com>
" Updated: Wed Feb 22 14:10:54 2012 by galileo@galileo

" Holds the set commands 
" Newly noticed interesting commands
" set wrapscan --> set ws, searches wrap around the EOF, allies to ]s and [s

function! Set_init_defaults()
	" NOTE: Setting or resetting no/compatible option can have a lot of unexpected
	"		effects: Mappings are interpreted in another way, undo behaves
	"		differently, etc.  If you set this option in your vimrc file, you
	"		should probably put it at the very start.
	set nocompatible

	set listchars+=precedes:<,extends:>

	"set backup
	"set backupcopy=auto

	set swapfile
	set swapsync=fsync
	set modeline
	set ttyfast
	set scrolljump=5
	set undolevels=50
	set updatecount=250
	set whichwrap+=b,s,<,>,h,l,[,]
	set nowrap
	set autoindent
	set smartindent
	set autoread
	"set backspace=indent,eol,start
	set cmdheight=1
	"set complete=.,w,b,u,U,t,i,d
	set cursorline
	set history=3000
	set laststatus=2
	set linebreak
	set magic 
	set maxmem=100000 "24MB
	set noautowrite
	"set expandtab
	set ruler
	set nospell
	set nohidden
	set noerrorbells visualbell t_vb= "Disable ALL bells
	set number
	"set pastetoggle=<f11>
	set scrolloff=3
	set showcmd
	set showfulltag
	set showmode
	set sidescroll=2
	set sidescrolloff=2
	set noguipty
	set splitright
	set splitbelow
	set restorescreen=on
	set hlsearch
	set laststatus=2
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set switchbuf=usetab
	set commentstring=#%s
	set tabpagemax=55
	set showtabline=2
	set smarttab

	" TODO: play with fold settings
	set foldmethod=marker
	set foldenable
	set foldcolumn=1

	set incsearch
	set sc
	set sidescroll=5
	set smartcase
	set showmatch
	set diffopt=filler,iwhite
	set stal=2
	set formatoptions=tcro
	set autochdir
	set textwidth=80 " textwidth
	set linebreak

	set sidescroll=5

	if exists('+colorcolumn')
		set colorcolumn=80
	endif
endfunc

function! Set_c_defaults()
	" Vim color file -- askapachecode
	" Maintainer: AskApache <webmaster@askapache.com>
	" Updated: Wed Feb 22 14:10:54 2012 by galileo@galileo

	"set backup
	"set backupcopy=auto
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
	set commentstring=#%s " set cms

	" TODO: Find out if i need this line or if it was just a copy and redundant.
	"		First glance feels redundant.
	filetype on
	autocmd FileType c,cpp,python autocmd BufWritePre <buffer> %s/\s\+$//e

	" Syntastic stuff trying to ignore not being able to track down headers in
	" different directories/non standard.
	" TODO: Find a way to show it how to find a ./include/*.h path so it can
	"		do the syntax checking instead of crapping out
	" let g:syntastic_c_remove_include_errors = 1
	" let g:syntastic_c_check_header = 0
	" let g:syntastic_no_include_search = 1
	" let g:syntastic_remove_include_errors = 1
endfunc

function! Set_make_defaults()
	" Settings specific to makefiles
	set noexpandtab
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set showtabline=2
	set smarttab
endfunc

function! Set_python_defaults()
	set expandtab
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set showtabline=2
	set smarttab
endfunc

function! Set_txt_defaults()
	set noerrorbells visualbell t_vb= "Disable ALL bells, Just making sure :)
	set tabstop=8
	set softtabstop=8
	set shiftwidth=8
endfunc

if exists('+colorcolumn')
    set colorcolumn=80 
endif

autocmd FileType c,cpp,java,php,python 
\ autocmd BufWritePre <buffer> %s/\s\+$//e
 
" Saves the place you are at in a file (probably) so you are there when you go
" back into the buffer.
au BufReadPost * 
\	if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
\ | exe "normal! g'\"" 
\ | endif
