function set.locale.en () {
  LANG=pt_BR.UTF-8
  LANGUAGE=
  LC_CTYPE="en_US.UTF-8"
  LC_NUMERIC="en_US.UTF-8"
  LC_TIME="en_US.UTF-8"
  LC_COLLATE="en_US.UTF-8"
  LC_MONETARY="en_US.UTF-8"
  LC_MESSAGES="en_US.UTF-8"
  LC_PAPER="en_US.UTF-8"
  LC_NAME="en_US.UTF-8"
  LC_ADDRESS="en_US.UTF-8"
  LC_TELEPHONE="en_US.UTF-8"
  LC_MEASUREMENT="en_US.UTF-8"
  LC_IDENTIFICATION="en_US.UTF-8"
  LC_ALL=en_US.UTF-8
}

function set.locale.br () {
  LANG=en_US.UTF-8
  LANGUAGE=
  LC_CTYPE="en_US.UTF-8"
  LC_NUMERIC="en_US.UTF-8"
  LC_TIME="en_US.UTF-8"
  LC_COLLATE="en_US.UTF-8"
  LC_MONETARY="en_US.UTF-8"
  LC_MESSAGES="en_US.UTF-8"
  LC_PAPER="en_US.UTF-8"
  LC_NAME="en_US.UTF-8"
  LC_ADDRESS="en_US.UTF-8"
  LC_TELEPHONE="en_US.UTF-8"
  LC_MEASUREMENT="en_US.UTF-8"
  LC_IDENTIFICATION="en_US.UTF-8"
  LC_ALL=en_US.UTF-8
}


function install.postgres () {
  set.locale.br
  sudo apt-get install postgresql-9.4-postgis-2.1 postgresql-9.4-plv8 postgresql-contrib-9.4 -y
  set.locale.en
}



function more.locales () {
  locale -a
  /etc/locale.gen
  locale-gen
  # 1) Check your /etc/locale.gen and see that the locale you wish to choose is uncommented. (mine was en_US.utf8)
  # 2) Type ‘locale-gen’ as root, should be no errors here.
  # 3) Edit /etc/environment and add the following lines:
  nano /etc/environment
  LANG=en_US
  LC_CTYPE=en_US.UTF-8
  LC_MESSAGES=en_US.UTF-8
  LC_COLLATE=en_US.UTF-8
  LC_ALL=en_US.UTF-8
  nano /etc/environment
  echo LANG=en_US > /etc/environment
  echo LC_CTYPE=en_US.UTF-8 >> /etc/environment
  echo LC_MESSAGES=en_US.UTF-8 >> /etc/environment
  echo LC_COLLATE=en_US.UTF-8 >> /etc/environment
  echo LC_ALL=en_US.UTF-8 >> /etc/environment


  # 4) That’s it. Logout and log back in. ‘locale -a’ should give no errors.

  #env | grep LANG
  #env | grep LC_

  #locales
  #option 1
  # dpkg-reconfigure locales
  # nano /etc/profile
  # : ${LANG:=pt_BR.UTF-8}; export LANG

  # option 2
  # nano /etc/environment
  LANG=pt_BR.UTF-8
  LC_CTYPE=pt_BR.UTF-8
  LC_MESSAGES=pt_BR.UTF-8
  LC_COLLATE=pt_BR.UTF-8
  LC_ALL=pt_BR.UTF-8


  update-locale LC_CTYPE=en_US.UTF-8

  nano /etc/environment

  update-locale LC_CTYPE=en_US.UTF-8

  nano /etc/environment

  LANGUAGE=pt_BR.UTF-8 

  update-locale LC_CTYPE=en_US.UTF-8

  # 1) Check your /etc/locale.gen and see that the locale you wish to choose is uncommented. (mine was en_US.utf8)
  # 2) Type ‘locale-gen’ as root, should be no errors here.
  # 3) Edit /etc/environment and add the following lines:
  nano /etc/environment
  LANG=en_US
  LC_CTYPE=en_US.UTF-8
  LC_MESSAGES=en_US.UTF-8
  LC_COLLATE=en_US.UTF-8
  LC_ALL=en_US.UTF-8

  # 4) That’s it. Logout and log back in. ‘locale -a’ should give no errors. 

  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8
}
