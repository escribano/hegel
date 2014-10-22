
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


function hegel.deploy.nginx () {
  if [ "$UNAME" == "Darwin" ]; then
    template.execute.nginx prd
    hegel.sync.cmd.kant "hegel.setup.nginx"
    #ssh www.habitacao.net ". ~/.profile; hegel.setup.nginx"
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi
}


function hegel.deploy.mapserver () {
  if [ "$UNAME" == "Darwin" ]; then
    template.execute.mapserver prd
    deploy.mapserver
    ssh www.habitacao.net ". ~/.profile; hegel.setup.mapserver"
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi
}

function hegel.deploy.database () {
  if [ "$UNAME" == "Darwin" ]; then
    template.execute.database prd
    deploy.database
    ssh www.habitacao.net ". ~/.profile; hegel.setup.database"
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi
}

