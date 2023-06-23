" Holds the set commands that are called in general before filetype specific
" calls to other .vim settings

"set backup
"set backupcopy=auto
set swapfile
set swapsync=fsync
set nocompatible
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
"set magic "enable magic
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
set foldmethod=marker
set foldenable
set foldcolumn=3
set incsearch
set sc
set smartcase
set showmatch
set diffopt=filler,iwhite
set stal=2
set formatoptions=cro
set autochdir

if exists('+colorcolumn')
    set colorcolumn=80
endif
