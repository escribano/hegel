function update.config () {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    local hegel_config="$HEGEL_PATH/config/hegelrc"
    cp "${hegel_config}.template.sh" "${hegel_config}.sh"
  else
    _fatal.error
  fi
}

function hegel.update () {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    pull.hegel
    source.hegel
    update.config
  else
    _fatal.error
  fi

}

function push.hegel {
  if [ "$UNAME" == "Darwin" ]; then
    pushd $HEGEL_PATH > /dev/null
    git add -A # -all
    git commit -am 'auto'
    git push origin master
    popd > /dev/null
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}

function push.owl {
  if [ "$UNAME" == "Darwin" ]; then
    pushd $DAEMON_PATH > /dev/null
    git add -A # -all
    git commit -am 'auto'
    git push origin master
    popd > /dev/null
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}

function push.civis {
  if [ "$UNAME" == "Darwin" ]; then
    pushd $CITY_PATH > /dev/null
    git add -A # -all
    git commit -am 'auto'
    git push origin master
    popd > /dev/null
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}

function pull.hegel {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    pushd $HEGEL_PATH > /dev/null
    git pull origin master
    popd > /dev/null
  else
    _fatal.error
  fi
}


function hegel.info () {
  local version="0.0.1"
  printf "Version: $version\n"
  printf "UNAME: $UNAME\n"
  printf "READLINK: $READLINK\n"
  printf "PHILOSOPHIE_PATH: $PHILOSOPHIE_PATH\n"
  printf "PHILOSOPHIE_XPATH: $PHILOSOPHIE_XPATH\n"
  printf "HEGEL_PATH: $HEGEL_PATH\n"
  printf "HEGEL_LIB_PATH: $HEGEL_LIB_PATH\n"
}

function mate.hegel () {
  if [ "$UNAME" == "Darwin" ]; then
    mate $HEGEL_PATH
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}

function mate.owl () {
  if [ "$UNAME" == "Darwin" ]; then
    mate $DAEMON_PATH
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}

function source.hegel {
  pushd $HEGEL_PATH > /dev/null
  source ./main.sh
  popd > /dev/null
}

function gohegel () {
  cd $HEGEL_PATH
}

function gowl () {
  cd $DAEMON_PATH
}



#----------------------------------



function clone.kant () {
  pushd $HEGEL_PATH/.. > /dev/null
  git clone git@github.com:escribano/kant.git
  popd > /dev/null
}

function clone.hegel () {
  pushd $HEGEL_PATH > /dev/null
  git clone git@github.com:escribano/hegel.git
  popd > /dev/null
}


function install.hegel () {
  #VAR_ROOT_PATH="$ROOT_PATH/var"
  #HEGEL_PATH="$ROOT_PATH/var/hegel"
  #SHELL_ROOT_PATH="$ROOT_PATH/shell/hegel"
  #PHILOSOPHIE_PATH="$HOME/philosophie"
  #HEGEL_PATH="$PHILOSOPHIE_PATH/hegel"
  #local user_profile="$HOME/.profile"
  #export HEGEL_CONFIG="$HOME/.hegelconfig"
  #cp $HEGEL_PATH/config/hegelconfig.sh $HEGEL_CONFIG
  local hegel_config="$HEGEL_PATH/config/hegelrc"
  cp $hegel_config.template.sh hegel_config.sh
  #local count=0
  #USER_PROFILE="$HOME/.profile"
  #printf "\nsource $HEGEL_PATH/main.sh\n" >> $user_profile
  printf "\nsource $HEGEL_PATH/main.sh\n" >> $user_profile
}

