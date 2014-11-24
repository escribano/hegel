# To build upon Greg's answer which explains that changes using the set command are limited to the process, if you want to limit scope of environment variable changes within a process, use the setlocal and endlocal commands. This allows you to isolate variables within a single command process.
# http://stackoverflow.com/questions/21819234/restrict-environment-variables-to-command-when-cross-compiling-golang-program-on
# $ setlocal
# $ set GOOS=linux
# $ go build -o myprog.bin myprog.go
# $ endlocal
# $ :: GOOS will now equal what it was before being set within the scope

  	  	
# This is what I was getting at, although I was hoping I could just pass the os to the go build command in a one liner.  setlocal && set GOROOT=C:\Go\Test\ && echo %GOROOT% && endlocal isn't run sequentially.  I guess goxc is the tool for the job. 

UNAME=`uname`
pgver="9.4"

function _config.pg.auth () {
  if [ "$UNAME" == "Linux" ]; then
    stop.postgres
    sleep 5
    #move.cluster
    #sleep 2
    config.cluster
    sleep 2
    start.postgres
  elif [ "$UNAME"  == "Darwin" ]; then
    echo "not supportet"
  fi
}

function stop.postgres {
  /etc/init.d/postgresql stop
}

function start.postgres {
  /etc/init.d/postgresql start
}

# sudo cat /etc/postgresql/9.4/main/pg_hba.conf
# sudo cat /etc/postgresql/9.4/main/pg_ident.conf
function config.cluster {
  if [ "$UNAME" == "Linux" ]; then
  cp /etc/postgresql/"${pgver}"/main/pg_hba.conf /etc/postgresql/"${pgver}"/main/pg_hba.conf.backup
  
  sed -n 'H;${x;s/# DO NOT DISABLE!.*\n/  \
# TYPE  DATABASE        USER            ADDRESS                 METHOD \
local   all             all                                     trust  \
local   all             all                                     ident map=philosoph \
local   all             all                                     ident \
local   all             all                                     peer \
local   all             all                                     md5 \
     \n\n\n&/;p;}' < /etc/postgresql/"${pgver}"/main/pg_hba.conf > /etc/postgresql/"${pgver}"/main/new_pg_hba.conf
  cp /etc/postgresql/"${pgver}"/main/new_pg_hba.conf /etc/postgresql/"${pgver}"/main/pg_hba.conf
  
  cp /etc/postgresql/"${pgver}"/main/pg_ident.conf /etc/postgresql/"${pgver}"/main/pg_ident.conf.backup
  echo '' >> /etc/postgresql/"${pgver}"/main/pg_ident.conf
  echo "philosoph           root                    postgres" >> /etc/postgresql/"${pgver}"/main/pg_ident.conf
  echo "philosoph           ademir                  postgres" >> /etc/postgresql/"${pgver}"/main/pg_ident.conf
  echo "philosoph           www-data                rousseau" >> /etc/postgresql/"${pgver}"/main/pg_ident.conf
  echo '' >> /etc/postgresql/"${pgver}"/main/pg_ident.conf
  elif [ "$UNAME"  == "Darwin" ]; then
    echo "not supported"
  fi
}

function move.cluster {
  if [ "$UNAME" == "Linux" ]; then
    # move cluster
    mkdir -p /mnt/ebs/db/{etc,lib,log}
    mv /etc/postgresql     /mnt/ebs/db/etc/
    mv /var/lib/postgresql /mnt/ebs/db/lib/
    mv /var/log/postgresql /mnt/ebs/db/log/
    mkdir /etc/postgresql /var/lib/postgresql /var/log/postgresql
    echo "/mnt/ebs/db/etc/postgresql /etc/postgresql none bind" | sudo tee -a /etc/fstab
    echo "/mnt/ebs/db/lib/postgresql /var/lib/postgresql none bind" | sudo tee -a /etc/fstab
    echo "/mnt/ebs/db/log/postgresql /var/log/postgresql none bind" | sudo tee -a /etc/fstab
    mount /etc/postgresql
    mount /var/lib/postgresql
    mount /var/log/postgresql
  elif [ "$UNAME"  == "Darwin" ]; then
    echo "not supportet"
  fi
}

function teste.sudo () {
  sudo -i
  echo "test.sudo" >> /root/test
  logout
}

_config.pg.auth