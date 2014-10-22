function hegel.intall.nginx () {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    sudo -i
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install nginx -y
    #Suggested packages:
    #  libgd-tools geoip-bin fcgiwrap nginx-doc
    sudo unlink /etc/nginx/sites-enabled/default
  else
    _fatal.error
  fi
}