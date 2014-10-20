#!/bin/bash
#set -e # Exit if any command returns non-zero.
UNAME=`uname`
#echo "$UNAME"

if [ "$UNAME" == "Darwin" ]; then
	#echo "this is mac"
	#`which greadlink`
	if [ ! `which greadlink` ]; then
		#echo 'That was a good job!'
		HEGEL_ROOT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	else
		READLINK="greadlink"
		HEGEL_ROOT_PATH=$(dirname $($READLINK -f $BASH_SOURCE))
	fi
	#alias readlink=greadlink
	#READLINK="greadlink"
	#if [ "$NETWORKING" = "no" ]
	#then
	#        exit 0
	#fi
elif [ "$UNAME" == "Linux" ]; then
	READLINK="readlink"
	HEGEL_ROOT_PATH=$(dirname $($READLINK -f $BASH_SOURCE))
else
	echo "not yet"
	exit 0
fi

#tas || true
#echo "$0"
#echo "$(dirname ($0))"
#echo "($0)"
#ROOT_PATH=$(dirname $($READLINK -f $0))
#ROOT_PATH=$(dirname $($READLINK -f $BASH_SOURCE))
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#ROOT_PATH3=$(dirname ${BASH_SOURCE%/*})
HEGEL_LIB_PATH="$HEGEL_ROOT_PATH/lib"
#LIB_PATH="$LIB_PATH/stack"
#scriptPath=${0%/*}
#echo "$BASH_SOURCE"
#echo "${BASH_SOURCE%/*}"
#echo "$ROOT_PATH"
#echo "$ROOT_PATH"
#echo "$ROOT_PATH3"

#echo "setup root in $ROOT_PATH"

#source "$HABITATIONE_LIB_PATH/address.sh"
#source "$HABITATIONE_LIB_PATH/archiving.sh"
#source "$HABITATIONE_LIB_PATH/clean.sh"
#source "$HABITATIONE_LIB_PATH/colors.sh"
#source "$HABITATIONE_LIB_PATH/data.sh"
#source "$HABITATIONE_LIB_PATH/ebs.sh"
#source "$HABITATIONE_LIB_PATH/ec2.sh"
#source "$HABITATIONE_LIB_PATH/funk.sh"
#source "$HABITATIONE_LIB_PATH/jessie.sh"
#source "$HABITATIONE_LIB_PATH/libs.sh"
#source "$HABITATIONE_LIB_PATH/mapa.sh"
#source "$HABITATIONE_LIB_PATH/node.sh"
#source "$HABITATIONE_LIB_PATH/postgres.sh"
#source "$HABITATIONE_LIB_PATH/ready.sh"
#source "$HABITATIONE_LIB_PATH/security.sh"
#source "$HABITATIONE_LIB_PATH/setup.sh"
################################################################################
#source "$HABITATIONE_LIB_PATH/env.sh"
#source "$HABITATIONE_LIB_PATH/colours.sh"
#source "$HABITATIONE_LIB_PATH/prompt.sh"
#source "$HABITATIONE_LIB_PATH/profile.sh"
#source "$HABITATIONE_LIB_PATH/dev.sh"
#source "$HABITATIONE_LIB_PATH/git.sh"
#source "$HABITATIONE_LIB_PATH/helpers.sh"
################################################################################
#source "$HABITATIONE_LIB_PATH/util.sh"
#source "$HABITATIONE_LIB_PATH/go.sh"
#source "$HABITATIONE_LIB_PATH/db-settings.sh"
#source "$HABITATIONE_LIB_PATH/db-setup.sh"
#source "$HABITATIONE_LIB_PATH/db-tools.sh"
#source "$HABITATIONE_LIB_PATH/mac.sh"
#source "$HABITATIONE_LIB_PATH/links.sh"
#source "$HABITATIONE_LIB_PATH/upstream.sh"
#source "$HABITATIONE_LIB_PATH/nginx.sh"
#source "$HABITATIONE_LIB_PATH/daemon.sh"
#source "$HABITATIONE_LIB_PATH/filosofia.sh"
#source "$HABITATIONE_LIB_PATH/todo.sh"
#source "$HABITATIONE_LIB_PATH/ec2.sh"
#source "$HABITATIONE_LIB_PATH/alias.sh"
#source "$HABITATIONE_LIB_PATH/brew.sh"
#source "$HABITATIONE_LIB_PATH/network.sh"
#source "$HABITATIONE_LIB_PATH/hegel.sh"
#source "$HABITATIONE_LIB_PATH/deploy.sh"
################################################################################
source "$HEGEL_LIB_PATH/util.sh"
source "$HEGEL_LIB_PATH/boot.sh"
source "$HEGEL_LIB_PATH/ebs.sh"
source "$HEGEL_LIB_PATH/nginx.sh"
source "$HEGEL_LIB_PATH/tar.sh"
source "$HEGEL_LIB_PATH/hab.sh"
source "$HEGEL_LIB_PATH/tools.sh"
source "$HEGEL_LIB_PATH/go.sh"
source "$HEGEL_LIB_PATH/sein.sh"
source "$HEGEL_LIB_PATH/postgres.sh"

source "$HEGEL_LIB_PATH/main.sh"

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