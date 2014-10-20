function install.hegel () {
  #VAR_ROOT_PATH="$ROOT_PATH/var"
  #HEGEL_PATH="$ROOT_PATH/var/hegel"
  #SHELL_ROOT_PATH="$ROOT_PATH/shell/hegel"
  #PHILOSOPHIE_PATH="$HOME/philosophie"
  #HEGEL_PATH="$PHILOSOPHIE_PATH/hegel"
  local user_profile="$HOME/.profile"
  #local count=0
  #USER_PROFILE="$HOME/.profile"
  #printf "\nsource $HEGEL_PATH/main.sh\n" >> $user_profile
  printf "\nsource $HEGEL_PATH/main.sh\n" >> $user_profile
}

function hegel.info () {
  printf "UNAME: $UNAME\n"
  printf "READLINK: $READLINK\n"
  printf "PHILOSOPHIE_PATH: $PHILOSOPHIE_PATH\n"
  printf "HEGEL_PATH: $HEGEL_PATH\n"
  printf "HEGEL_LIB_PATH: $HEGEL_LIB_PATH\n"
}

function hegel.update () {
  pull.hegel
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

function pull.hegel {
  pushd $HEGEL_PATH > /dev/null
  git pull origin master
  popd > /dev/null
}

function clone.hegel () {
  pushd $HEGEL_PATH > /dev/null
  git clone git@github.com:escribano/hegel.git
  popd > /dev/null
}




