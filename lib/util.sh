function install.hegel () {
  #VAR_ROOT_PATH="$ROOT_PATH/var"
  #HEGEL_PATH="$ROOT_PATH/var/hegel"
  #SHELL_ROOT_PATH="$ROOT_PATH/shell/hegel"
  #PHILOSOPHIE_PATH="$HOME/philosophie"
  #HEGEL_PATH="$PHILOSOPHIE_PATH/hegel"
  USER_PROFILE="$HOME/.profile"
  printf "\nsource $HEGEL_PATH/main.sh\n" >> $USER_PROFILE
}

function source.hegel {
  pushd $HEGEL_PATH > /dev/null
  source ./main.sh
  popd > /dev/null
}

function gohegel () {
  cd $HEGEL_PATH
}

function push.hegel {
  pushd $HEGEL_PATH > /dev/null
  git add -A # -all
  git commit -am 'auto'
  git push origin master
  popd > /dev/null
}

function clone.hegel () {
  SAVED_PWD=`pwd`
  cd $HEGEL_PATH
  git clone git@github.com:escribano/hegel.git
  cd $SAVED_PWD
}

function pull.hegel {
  SAVED_PWD=`pwd`
  cd $HEGEL_PATH
  git pull origin master
  cd $SAVED_PWD
}







function local.sample () {
  local str=""
  local count=0
}


