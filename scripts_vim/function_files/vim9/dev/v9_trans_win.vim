vim9script

# The toggle transparent function 
#
# TODO: Figure out a way to change the gnome-terminal opaticity either via
#	    vimscript on top or with an os key setting that can be set elsewhere
#		like bash/sh
#
# TODO: 
# - Check if prev_cterm_bg had values and is filled. maybe a flag? May resolve
# - Make this Vim9 syntax

if exists("g:V9trans")
	finish
endif
var g:V9trans = true

var Hi_group_names = [
					  "Normal",
					  "LineNr",
					  "Folded",
					  "NonText",
					  "SpecialKey",
					  "VertSplit",
					  "SignColumn",
					  "FoldColumn"
				  \ ]

var Prev_cterm_bg = {}

# TODO: Function to add/remove a group name to the trans_hi_groups

# for transparent background
def V9transparent_switch(): void
	# go through highlight groups
	for hi_group in Hi_group_names
		var hi_group_id = hlID(hi_group)
		Prev_cterm_bg[hi_group] = synIDattr(synIDtrans(hi_group_id), "bg")

		# If the resulting bg is non-existant a empty string is returned.
		# If an empty string is found, replace it with 'none' to use in an
		# exec command when switching back. Using just empty string causes an
		# error with :hi .... ctermbg=''
		if Prev_cterm_bg[hi_group] == ""
			Prev_cterm_bg[hi_group] = "none"
		endif

		execute "highlight" hi_group  "ctermbg=none"
	endfor
	# set nocursorline
enddef
# autocmd ColorScheme * call AdaptColorscheme()

# Switch back to opaque from a previous call to switch_transparent
def V9transparent_back(): void
	for hi_group in Hi_group_names
		execute "highlight" hi_group  "ctermbg=" .. Prev_cterm_bg[hi_group]
	endfor
	# set cursorline
enddef

# Allows the ability to toggle transparency (no gvim currently)
var Is_trans = 0
def! g:V9transparent_toggle(): void
	if Is_trans == 0
		# Sets term vim to transparent
		V9transparent_switch()
		Is_trans = 1
	else
		# Sets term vim to opaque
		V9transparent_back()
		Is_trans = 0
	endif
enddef
# nnoremap <C-t> : call Toggle_transparent()<CR>
