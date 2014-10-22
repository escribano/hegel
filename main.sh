#!/bin/bash
#set -e # Exit if any command returns non-zero.
export UNAME=`uname`
#echo "$UNAME"

if [ "$UNAME" == "Darwin" ]; then
	#echo "this is mac"
	#`which greadlink`
	if [ ! `which greadlink` ]; then
		#echo 'That was a good job!'
		export HEGEL_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	else
		export READLINK="greadlink"
		export HEGEL_PATH=$(dirname $($READLINK -f $BASH_SOURCE))
	fi
	#alias readlink=greadlink
	#READLINK="greadlink"
	#if [ "$NETWORKING" = "no" ]
	#then
	#        exit 0
	#fi
elif [ "$UNAME" == "Linux" ]; then
	export READLINK="readlink"
	export HEGEL_PATH=$(dirname $($READLINK -f $BASH_SOURCE))
else
	echo "not yet"
	exit 0
fi

#export PHILOSOPHIE_PATH="$HEGEL_PATH/../.."
export HEGEL_LIB_PATH="$HEGEL_PATH/lib"
#echo "setup root in $ROOT_PATH"

source "$HEGEL_LIB_PATH/util.sh"
source "$HEGEL_LIB_PATH/boot.sh"
source "$HEGEL_LIB_PATH/tools/tar.sh"
source "$HEGEL_LIB_PATH/tools/tools.sh"
source "$HEGEL_LIB_PATH/tools/error.sh"
source "$HEGEL_LIB_PATH/sync/sync.sh"
source "$HEGEL_LIB_PATH/deploy/deploy.sh"
source "$HEGEL_LIB_PATH/nginx/nginx.sh"
source "$HEGEL_LIB_PATH/setup/setup.sh"

#source "$HEGEL_PATH/config/hegelrc.sh"
source "$HEGEL_LIB_PATH/xinstall.sh"

hegel.source.config

hegel.hook

#source "$LIB_PATH/.sh"
#echo "ami functions installed from $LIB_PATH/ec2/ami.sh"

#echo ${#BASH_ARGV[@]}
#echo "${BASH_ARGV[0]%bang.sh}"

#function srcami {
#	ec2-describe-images  --region sa-east-1 ami-9717b78a
#}

#exit

#if [ ! -n "$1" ]; then
#	echo "Usage: ./install <recipe>"
#	exit 1;
#fi

#RECIPE="$ROOT_PATH/recipes/$1"
#RECIPE="$ROOT_PATH/lib/recipes/$1"
#if [ -e $RECIPE ] ; then
#	source "$RECIPE"
#fi

#install_`echo $1`


#setup.hegel
