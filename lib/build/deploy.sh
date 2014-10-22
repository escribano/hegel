function deploy.plato () {
  if [ "$UNAME" == "Darwin" ]; then
    DIST_DIR="/tmp"
    DIST_SRV=www
    ARCHIVE_NAME="plato"
    FROM_DIR="/tmp/$ARCHIVE_NAME"
    rm -rf $FROM_DIR
    mkdir -p $FROM_DIR
    cp -R $PHILOSOPHIE_PATH/html/$ARCHIVE_NAME $FROM_DIR
    tar -c --exclude-from=$HEGEL_PATH/.tarignore -vzf "$DIST_DIR"/$ARCHIVE_NAME.tar.gz -C $FROM_DIR .
    scp $DIST_DIR/$ARCHIVE_NAME.tar.gz $DIST_SRV.habitacao.net:/tmp
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi
}

function hegel.deploy.plato () {
  if [ "$UNAME" == "Darwin" ]; then
    deploy.plato
    ssh www.habitacao.net ". ~/.profile; hegel.setup.plato"
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi
}

function hegel.deploy.owl () {
  if [ "$UNAME" == "Darwin" ]; then
    deploy.owl
    ssh www.habitacao.net ". ~/.profile; hegel.setup.owl"
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi
  
}

function hegel.deploy.civis () {
  if [ "$UNAME" == "Darwin" ]; then
    deploy.civis
    ssh www.habitacao.net ". ~/.profile; hegel.setup.civis"
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi
}




