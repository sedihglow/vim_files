#!/usr/bin/env bash

# TODO (Whole Script): Kinda went in a general order of approach from top down
#
#
#		General for config call and arguments -
#		1)
#		- Write the line that will call the configure script with the
#		  desired arguments for features and macro definitions to be enabled.
#		  - First make it only the arguments that i want adjusting after
#			setting the build to HUGE. (No arguments enabling stuff HUGE flag
#			already enables, will disable ones from HUGE i do not want.)
#		  - LATER (will list it later in list aswell if i remember):
#			Write out a version that individually activates desired features,
#			regardless of tiny/huge/etc. Probably wont need it so backburner it
#		2)
#		- Instead of writing all the desired arguments in the script for the
#		  initial build i am working on get the configure arguments outside
#		  of the script from a file.
#		  - Have the configure arguments in a separate file and pull them into
#			this script to be used on the configure call.
#		  - Have the file with the ./configure arguments be a argument for
#			this script and it be optional in the same way as the path for the
#			top-level ./configure script
#		----
#
#		List of potential args from planning below
#
#		-h : help print out
#		-s : Path to top level ./configure script
#		-a : Path to ./configure arguments
#		-u [all, config, args] : 
#			[all] - ask for user input first by default for all paths
#			[config] - ask user input first for just ./configure path
#			[args] - ask for user input for just config arguments
#			[  ] - If no option arg for -u is provided, it defaults to "all".
#		-d [tiny, small, normal, big, huge] :
#	    	- This flag will ignore the arguments file and instead just run
#			  configure with the basic default features that are applied by
#			  setting the feature list.
#			- The arguments apply the feature settings with the same name as
#			  Vim. See Vim docs (|+feature-list|) to see which feature set
#			  applies which features and settings. Vim's default is huge i
#			  believe.
#			- List of features can also be found in my vim_files repo.
#			  ./vim_files/src_build_stuff/first_workthrough/feature_list.txt
#
#
#		----
#
#		Quick ideas for this script
#
#		-= Finding ./configure script located in the Vim repo =-
#		- Have argument for path for where the Vim configure script
#		  script is located on the system. Stay simple at this point.
#			- This will let the user choose if they want a particular configure
#			  script ran outside of the recomended one at the top-level dir as
#			  well if desired. Or if they have their own version.
#
#		-  Have default behavior if user does not provide a path in the arg.
#			- have potential install script listed in TODO (1) give it a
#			  default name and system path. (For not just handle being on a
#			  Ubuntu system that i am currently running.) to look for.
#			- Or/Then, Potentially check all dir/files in ./ from this scripts
#			  pwd.
#			- If that fails, ask for user input. 
#			  (Give arg to pref input from user for everything or individually)
#			- Default to look for top level configure script.
#			- For the configure script - we should not need to use any of the
#			  subdir configure scripts, unlike the note in ./Makefile
#			  which may require running src/Makefile manually if top errors.
#		-===-
#
#		-= Finding file containing ./configure arguments =-
#		- Have argument for path for where the file containing arguments for
#		  ./configure is located (ex. configure_args.config (.txt?). 
#		  This will require a specific format. (likely just one argument per 
#		  line, keep it simple)
#
#		- Have default behavior if user does not provide a path in the arg.
#		  - Have a default filename to look for.
#			- have potential install script listed in TODO (1) give it a
#			  default name and system path. (For not just handle being on a
#			  Ubuntu system that i am currently running.) to look for.
#			- Potentially check all dir/files in ./ from this scripts pwd
#			- If that fails, ask for user input. 
#			  (Give arg to pref input from user for everything or individually)
#		-===-
#
#		- Make it generally more robust to this point. Error checking w/
#		  whatever (user inputs, returns etc.), clean exits, etc.
#
#	------ Start with the above ---
#	:Future Work ideas from this point:
#	- This script may only contain the configure stuff and be called on
#	  by a higher level script.
#	- This script may also end up being developed into a single script that 
#	  does the whole vim build
#	- After talking with john, eventually the vim build will be scripted out
#	  in one way or another and be used in an initialization script for new
#	  personal setups.
# Make sure to cd into the top-level Vim repo with the config script so it
# can place the files it creates in the proper locations.
#
##		List of potential args from planning below
#
#		-h : help print out
#		-s : Path to top level ./configure script
#		-a : Path to ./configure arguments
#		-u [all, config, args] : 
#			[all] - ask for user input first by default for all paths
#			[config] - ask user input first for just ./configure path
#			[args] - ask for user input for just config arguments
#			[  ] - If no option arg for -u is provided, it defaults to "all".
#		-d [tiny, small, normal, big, huge] :
#	    	- This flag will ignore the arguments file and instead just run
#			  configure with the basic default features that are applied by
#			  setting the feature list.
#			- The arguments apply the feature settings with the same name as
#			  Vim. See Vim docs (|+feature-list|) to see which feature set
#			  applies which features and settings. Vim's default is huge i
#			  believe.
#			- List of features can also be found in my vim_files repo.
#			  ./vim_files/src_build_stuff/first_workthrough/feature_list.txt
#

conf_script=""
arg_file=""
filename=""
dirpath=""

inside_function()
{
	echo "Arguments passed to inside_function()"
	echo "---> $@"

	while getopts "a:b::" opt; do
	  case "$opt" in
		a) 
			echo "IN A BLOCK - "
			arg_file=$OPTARG
			echo -e "optarg: $OPTARG\n"\
				 "\barg_file: $arg_file\n"\
				 "\bThird time through"
			
			;;

		b) 
			echo "IN B BLOCK - "
			echo $OPTARG
			;;
		:)
			echo "Option -$OPTARG requires an argument"
			;;
			
		\?)
			echo "Error: Invalid option passed: -$OPTARG"
			;;
	  esac
	done

	shift $((OPTIND - 1))

    # Iterate over the remaining arguments
	echo 'Remaining arguments:'
    for arg; do
        echo "--> '$arg'"
    done

	# Resetting OPTIND because it does not get reset when the function exits
	# and when getopts potentially gets called again outside of this function.
	OPTIND=1
}

inside_function $@

echo "testing global from function : $arg_file"
