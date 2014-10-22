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

if [ "$UNAME" == "Darwin" ]; then
  source "$HEGEL_PATH/profile/darwin.profile"
fi

source "$HEGEL_LIB_PATH/util.sh"

source "$HEGEL_LIB_PATH/amazon/ec2.sh"
source "$HEGEL_LIB_PATH/amazon/boot.sh"
source "$HEGEL_LIB_PATH/amazon/ec2-ebs.sh"
source "$HEGEL_LIB_PATH/amazon/ec2-address.sh"
source "$HEGEL_LIB_PATH/amazon/ephemeral.sh"
source "$HEGEL_LIB_PATH/amazon/ebs.sh"

source "$HEGEL_LIB_PATH/build/deploy.sh"
source "$HEGEL_LIB_PATH/build/install.sh"
source "$HEGEL_LIB_PATH/build/plato.sh"
source "$HEGEL_LIB_PATH/build/sync.sh"
source "$HEGEL_LIB_PATH/build/owl.sh"

source "$HEGEL_LIB_PATH/nginx/install.sh"
source "$HEGEL_LIB_PATH/nginx/control.sh"

source "$HEGEL_LIB_PATH/tools/colours.sh"
source "$HEGEL_LIB_PATH/tools/error.sh"
source "$HEGEL_LIB_PATH/tools/git.sh"
source "$HEGEL_LIB_PATH/tools/go.sh"
source "$HEGEL_LIB_PATH/tools/helpers.sh"
source "$HEGEL_LIB_PATH/tools/mac.sh"
source "$HEGEL_LIB_PATH/tools/network.sh"
source "$HEGEL_LIB_PATH/tools/prompt.sh"
source "$HEGEL_LIB_PATH/tools/tar.sh"
source "$HEGEL_LIB_PATH/tools/tools.sh"
source "$HEGEL_LIB_PATH/tools/upstream.sh"
source "$HEGEL_LIB_PATH/tools/crosscompile.bash"

source "$HEGEL_PATH/help/help.sh"

hegel.source.config

hegel.hook

setup.colours

if [ "$UNAME" == "Darwin" ]; then
  #export GOPATH=$HOME/code/habitatione/go
  export GOPATH="$PHILOSOPHIE_PATH/go"
  export PATH=$PATH:$GOPATH/bin
fi

if [ "$UNAME" == "Darwin" ]; then
  export CLICOLOR=YES
  activate.liquidprompt
  setup.ec2
fi

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
