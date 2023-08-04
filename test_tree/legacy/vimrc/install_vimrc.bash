#!/usr/bin/env bash

# Use PWD to start with and that will likely be default unless path is provided

# maybe have arguments to alter where the .vimrc goes but have the rest of the
# files in .vim. Look up the locations for global/local+root vimrc and just take into
# acount handling them.

# if .vimrc exists, store it somewhere in case they want to revert
#	- have a functionality to revert?? If reasonable.

# Write something to build the test directory tree as well if it does not exist.
# Make this shit legit so you never have to do it again!

# Check if home dir .vimrc exists
if [[ -e "../.vimrc" ]]; then
	echo "../.vimrc already exists"

	# get user input to confirm what to do about overwriting/storing BU etc.
	# Perhaps have a choice to add specific functions from func_inc using
	# flags or some shit
	# till then:
	rm -f ../.vimrc \ # this may end up in .vim later
	      ../.vim/vimrc/.makefile_vimrc.vim \
	      ../.vim/vimrc/.dflt_set_cmds_vimrc.vim \
	      ../.vim/vimrc/.syn_hi_vimrc.vim \
	      ../.vim/vimrc/.txt_vimrc.vim \
	      ../.vim/vimrc/.c_vimrc.vim \
		  ../.vim/vimrc/.py_vimrc.vim \
		  ../.vim/scripts/path_string_examples.vim
fi

# TODO: Look into realpath's options and see how to make this more robust using 
# them if possible

# TODO: this assumes the files being linked right now are in the pwd
# of the script being ran. make it better ^_^
ln -s "$(realpath ./.vimrc)" ../.vimrc

# Place the vim files in a place, if the place doesnt exist make it. 
# For now i made it exist

# Figure out a better way to do this - or see what other options are - 
# not having to hardcode it so much using a for or something - or some way to 
# do it all in less ln calls.
ln -s "$(realpath ./.txt_vimrc.vim)" \
	../.vim/vimrc/.txt_vimrc.vim
ln -s "$(realpath ./.c_vimrc.vim)" \
	../.vim/vimrc/.c_vimrc.vim
ln -s "$(realpath ./.py_vimrc.vim)" \
	../.vim/vimrc/.py_vimrc.vim
ln -s "$(realpath ./.makefile_vimrc.vim)" \
	../.vim/vimrc/.makefile_vimrc.vim
ln -s "$(realpath ./.dflt_set_cmds_vimrc.vim)" \
	../.vim/vimrc/.dflt_set_cmds_vimrc.vim
ln -s "$(realpath ./.syn_hi_vimrc.vim)" \
	../.vim/vimrc/.syn_hi_vimrc.vim
ln -s "$(realpath ../my_plugins/examples/path_string_examples.vim)" \
	../.vim/examples/path_string_examples.vim

