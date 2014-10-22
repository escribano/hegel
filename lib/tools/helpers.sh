

function show.function {
   declare -f "$1"
}

tman() {
  man "${1}" | col -b | open -f -a "TextEdit"
}

mateman() {
  man "${1}" | col -b | open -f -a "TextMate"
}

getpdfs1() {
  DIR=~/wget/
  AGENT="Mozilla/4.0 (Windows; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)"
  WAIT=3
  ACCEPT='pdf'
  # '*.mp3'
  
  mkdir -p $DIR
  wget -P $DIR -x -U "$AGENT" -w $WAIT -A $ACCEPT --ignore-case -r -l inf -np --restrict-file-names=nocontrol "${1}"
  # -r -l inf -np
}

getall() {
  DIR=~/wget/
  AGENT="Mozilla/4.0 (Windows; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)"
  WAIT=3
  
  mkdir -p $DIR
  wget -P $DIR -x -U "$AGENT" -w $WAIT --ignore-case -r -l inf -np --restrict-file-names=nocontrol "${1}"
}

restartDnsmasq() {
  sudo launchctl stop homebrew.mxcl.dnsmasq
  sudo launchctl start homebrew.mxcl.dnsmasq
}


getcmd() {
  DIR=~/wget/
  mkdir -p $DIR
  wget -P $DIR -x "${1}"
  
  # getpdfs1 http://copyfight.me/Acervo/livros/
  
  #--restrict-file-names=modes
  #The modes are a comma-separated set of text values
  #The acceptable values are unix, windows, nocontrol, ascii, lowercase, and uppercase.
  
  # -P prefix
  # --directory-prefix=prefix

  # -U agent-string
  # --user-agent=agent-string
  
  # -w seconds
  # --wait=5
  # --random-wait
  
  # -r
  # --recursive
  
  #-l depth
  #--level=depth
  
  # -m
  # --mirror
  # equivalent to -r -N -l inf --no-remove-listing.
  
  #-N
  #--timestamping
  
  #--accept=pdf
  
  #-m --wait=5 --random-wait -r -l inf -nd -A pdf
  #-m --wait=3 --random-wait -k -np
  
  #-nd
  #--no-directories
  
  #-x
  #--force-directories
  
  #-nH
  #--no-host-directories
  
  #-k
  #--convert-links
  
  #-p
  #--page-requisites
  
  #-np
  #--no-parent
  
  #-A acclist --accept acclist
  #-R rejlist --reject rejlist
  #-A "*.mp3" or -A '*.mp3'.
  
  #--accept-regex urlregex
  #--reject-regex urlregex
  
  #-D domain-list
  #--domains=domain-list
  #it does not turn on -H.
  #-H
  #--span-hosts3
  # Enable spanning across hosts when doing recursive retrieving.
  
  #--ignore-case
  #--exclude-domains domain-list

}
