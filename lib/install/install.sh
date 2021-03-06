
function hegel.link () {
  local package_name=$1
  source $PHILOSOPHIE_XPATH/$package_name/main.sh
  echo "source \$PHILOSOPHIE_XPATH/$package_name/main.sh" > $HEGEL_PATH/hooks/$package_name.sh
}

function hegel.source.config () {
  source "$HEGEL_PATH/config/hegelrc.sh"
}

function hegel.hook () {
  #shopt -s globstar
  #_base="$HEGEL_PATH"
  #_dfiles="${_base}/hooks/*.sh"
  #echo $HEGEL_PATH
  #echo $_base
  #echo $_dfiles
  pushd $HEGEL_PATH/hooks > /dev/null
  #pwd
  for file in *.sh
  do
          #lb2file="/tmp/${f##*/}.$$"   #tmp file
          #sed 's/Load_Balancer-1/Load_Balancer-2/' "$f" > "${lb2file}"   # update signature 
          #scp "${lb2file}" nginx@lb2.nixcraft.net.in:${f}   # scp updated file to lb2
          #rm -f "${lb2file}"
          #echo "${f}"
          if [ -e "$file" ] ; then  # Make sure it isn't an empty match
            #COMMAND ... "$file" ...
            source "${file}"
          fi
          #source "${f}"
  done
  popd > /dev/null

}

function hegel.install () {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    local package_name=$1
    local install_dir=$PHILOSOPHIE_XPATH/$package_name
    #pushd $PHILOSOPHIE_XPATH/.. > /dev/null
    #git clone git@github.com:escribano/$package_name.git
    #cd kant
    rm -rf $install_dir && mkdir -p $install_dir
    tar xzvf /tmp/$package_name.tar.gz -C $PHILOSOPHIE_XPATH/$package_name
    #cd $PHILOSOPHIE_XPATH/$package_name
    #source main.sh
    #source $PHILOSOPHIE_XPATH/$package_name/main.sh
    #echo "source \$PHILOSOPHIE_XPATH/$package_name/main.sh"
    hegel.link $package_name
    #popd > /dev/null
  else
    _fatal.error
  fi

}

function hegel.upgrade () {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    hegel.install $@
  else
    _fatal.error
  fi

}

function hegel.clone () {
  if [ "$UNAME" == "Darwin" ]; then
    local package_name=$1
    local package_subdir=$2
    local package_dir="$PHILOSOPHIE_PATH/$package_subdir"
    mkdir -p $package_dir
    pushd $package_dir > /dev/null
    git clone git@github.com:escribano/$package_name.git
    cd $package_name
    source main.sh
    echo "mate $package_dir"
    popd > /dev/null
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}






#------------------------------------------




function hegel.git.install () {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
    local package_name=$1
    pushd $PHILOSOPHIE_XPATH/.. > /dev/null
    git clone git@github.com:escribano/$package_name.git
    cd kant
    source main.sh
    echo "source \$PHILOSOPHIE_XPATH/$package_name/main.sh"
    popd > /dev/null
  fi

}

function hegel.mac.install.kant () {
  pushd $HEGEL_XPATH/.. > /dev/null
  git clone git@github.com:escribano/kant.git
  source $KANT_PATH/main.sh
  source.kant
  popd > /dev/null
}


