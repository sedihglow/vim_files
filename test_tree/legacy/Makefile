# TODO: This was just thrown in to see if i could use it for the vim
# testing purposes. It appears i can.
#
# I do not know make well enough to take in arguments i can place in the recipe
# or in the command string bash -c "vim <filename arg>". Once i do the
# bash script in /bin/ that executes vim for the test directory tree
# might be obsolete and all done in this makefile

BIN = ./bin/

SRCS=$(wildcard ./functions/*.vim) # $(wildcard ../shared/src/*.c)

.PHONY: default-link-layout
default-link-layout:	# clean the directory
						$(info -- Setting Up The Directory Tree --)

.PHONY: run
run:					# run the program as follows
						$(info -- Running Program --)
						bash -c "vim -u ./vimrc/.vimrc ./testing"
