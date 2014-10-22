function hegel.setup.plato () {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    local package_name="plato"
    local install_dir=$ROOTSITE_PATH
    #local install_dir=$PHILOSOPHIE_XPATH/$package_name
    #INSTALL_DIR="/opt/hab/root"
    sudo rm -rf $install_dir && sudo mkdir -p $install_dir
    #sudo cp -R $HEGEL_PATH/site $INSTALL_DIR/
    sudo tar xzvf /tmp/$package_name.tar.gz -C $install_dir
    #pushd $PHILOSOPHIE_XPATH/.. > /dev/null
    #git clone git@github.com:escribano/$package_name.git
    #cd kant
    #rm -rf $install_dir && mkdir -p $install_dir
    #tar xzvf /tmp/$package_name.tar.gz -C $PHILOSOPHIE_XPATH/$package_name
    #cd $PHILOSOPHIE_XPATH/$package_name
    #source main.sh
    #source $PHILOSOPHIE_XPATH/$package_name/main.sh
    #echo "source \$PHILOSOPHIE_XPATH/$package_name/main.sh"
    #hegel.link $package_name
    #popd > /dev/null
  else
    _fatal.error
  fi

}

