#!/bin/bash

function displayUsageScreen {
	# <<- as opposed to << strips the leading tabs from the output
	cat <<- HERE
	Usage: $ScriptName # <arguments>

	Converts the data from http://snap.stanford.edu/data/egonets-Twitter.html
   to be used with the d3.js example found at http://bl.ocks.org/d3noob/5141278

   Only the *.edges files are used from the original dataset.

   (Further explanation of the example code at
   http://www.d3noob.org/2013/03/d3js-force-directed-graph-example-basic.html)
	
   Output is written to stdout.

	Options:
	   -h      : Displays this screen
	   -s <dir>: Specifies the source directory. Defaults to "."
	   -n <n>  : Specifies the number of *.edge files to consider for input
	             (The files are determined by ls *.edges | head -<n>)
	             Defaults to all edge files.
	   -e <n>  : Specifies the number of edges to write to the output
	             (The output is truncated via head -<n>)
	             Defaults to no truncation.
HERE
}

# -------------------------------------------------------------------------
# main program
ScriptName=`basename $0`

SRCDIR=.
# --- process options (example)
while getopts ":hs:e:n:" OPT
do
    case "$OPT" in
    h)  displayUsageScreen
        exit
        ;;

    s)  SRCDIR=$OPTARG
        ;;

    n)  NUMFILES=$OPTARG
        ;;

    e)  NUMEDGES=$OPTARG
        ;;

    :)  >&2 echo "Incorrect Syntax: -${OPTARG} needs argument. (Use -h for help)"
        exit 1
        ;;

     \?) >&2 echo "Incorrect Syntax: -${OPTARG} bad option. (Use -h for help)"
        exit 1
        ;;
    esac
done

shift $(expr $OPTIND - 1)

if [ $# -ne 0 ]
then
	displayUsageScreen
	exit 1
fi

ls $SRCDIR/*.edges > /dev/null 2>&1
if [ $? -ne 0 ]; then
   >&2 echo No '*.edges' files found in directory \"$SRCDIR\". Aborting.
   exit 1
fi

# Print header line
echo "source,target,value"

# Assemble and output the data
if [ -z "$NUMFILES" ]; then
   if [ -z "$NUMEDGES" ]; then
      cat $(ls $SRCDIR/*.edges) | sort -n | uniq | sed 's/ /,/;s/$/,1/'
   else
      cat $(ls $SRCDIR/*.edges) | sort -n | uniq | sed 's/ /,/;s/$/,1/' | head -$NUMEDGES
   fi
else
   if [ -z "$NUMEDGES" ]; then
      cat $(ls $SRCDIR/*.edges | head -$NUMFILES) | sort -n | uniq | sed 's/ /,/;s/$/,1/'
   else
      cat $(ls $SRCDIR/*.edges | head -$NUMFILES) | sort -n | uniq | sed 's/ /,/;s/$/,1/' | head -$NUMEDGES
   fi
fi
