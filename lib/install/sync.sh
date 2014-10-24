function hegel.sync.all () {
  
  if [ "$UNAME" == "Darwin" ]; then
    hegel.sync
    hegel.sync.kant
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}

function hegel.sync () {
  
  if [ "$UNAME" == "Darwin" ]; then
    push.hegel
    #ssh (L) hegel.update
    #ssh -t remote-server 'sudo ls'
    #ssh -t www.habitacao.net 'hegel.info'
    #ssh user@host "source /etc/profile; /path/script.sh"
    #ssh www.habitacao.net ". ~/.profile; hegel.info"
    ssh www.habitacao.net ". ~/.profile; hegel.update; hegel.info"
    
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}

function hegel.sync.kant () {
  
  if [ "$UNAME" == "Darwin" ]; then
    deploy.kant
    #ssh (L) hegel.update
    #ssh -t remote-server 'sudo ls'
    #ssh -t www.habitacao.net 'hegel.info'
    #ssh user@host "source /etc/profile; /path/script.sh"
    #ssh www.habitacao.net ". ~/.profile; hegel.info"
    ssh www.habitacao.net ". ~/.profile; hegel.upgrade kant; kant.info"
    
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}

function hegel.sync.cmd.kant () {
  
  if [ "$UNAME" == "Darwin" ]; then
    local cmd=$1
    deploy.kant
    #ssh (L) hegel.update
    #ssh -t remote-server 'sudo ls'
    #ssh -t www.habitacao.net 'hegel.info'
    #ssh user@host "source /etc/profile; /path/script.sh"
    #ssh www.habitacao.net ". ~/.profile; hegel.info"
    ssh www.habitacao.net ". ~/.profile; hegel.upgrade kant; ${cmd}"
    
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
  fi

}