function install.nginx () {
  sudo apt-get install nginx geoip-bin spawn-fcgi libfcgi-dev -y
  sudo unlink /etc/nginx/sites-enabled/default
  
  #sudo -i
  #sudo apt-get update && sudo apt-get upgrade -y
  #sudo apt-get install nginx -y
  #Suggested packages:
  #  libgd-tools geoip-bin fcgiwrap nginx-doc
  
  
  
}

function hegel.nginx.reload () {
  if [ "$UNAME" == "Darwin" ]; then
    sudo nginx -s reload
  elif [ "$UNAME" == "Linux" ]; then
    sudo /etc/init.d/nginx reload
  else
    _fatal.error
  fi
}
