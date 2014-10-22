function hegel.nginx.reload () {
  if [ "$UNAME" == "Darwin" ]; then
    sudo nginx -s reload
  elif [ "$UNAME" == "Linux" ]; then
    sudo /etc/init.d/nginx reload
  else
    _fatal.error
  fi
}
