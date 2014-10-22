function hegel.setup.owl () {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    local package_name="owl"
    local install_dir="$DAEMON_PATH"
    local config_dir="$DAEMON_CONFIG_PATH"
    sudo rm -rf $install_dir && sudo mkdir -p $install_dir
    sudo rm -rf $config_dir && sudo mkdir -p $config_dir
    sudo tar xzvf /tmp/owl.tar.gz -C $install_dir
    sudo mv $install_dir/config.prd.toml $config_dir/config.toml
  else
    _fatal.error
  fi

}