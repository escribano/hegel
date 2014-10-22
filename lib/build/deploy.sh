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

function deploy.owl () {
  if [ "$UNAME" == "Darwin" ]; then
    export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
    export COPYFILE_DISABLE=true
  	rm -rf /tmp/owl
  	mkdir -p /tmp/owl
  #	cp config.toml /tmp/owl
  	cp "$DAEMON_PATH/config.prd.toml" /tmp/owl
  	cp -R "$DAEMON_PATH/static" /tmp/owl
  	cp -R "$DAEMON_PATH/views" /tmp/owl
  	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /tmp/owl/owl github.com/escribano/owl
  	tar -c --exclude-from=$HEGEL_PATH/.tarignore -vzf /tmp/owl.tar.gz -C /tmp/owl .
  	scp /tmp/owl.tar.gz www.habitacao.net:/tmp
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




