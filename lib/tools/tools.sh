function show.function {
   declare -f "$1"
}

function reset.known.hosts () {
  if [ "$UNAME" == "Darwin" ]; then
    _fatal.error
  elif [ "$UNAME" == "Linux" ]; then
    _fatal.error
  else
    _fatal.error
    cat /dev/null > $HOME/.ssh/known_hosts
  fi
}

