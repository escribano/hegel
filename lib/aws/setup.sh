function fixhostname () {
  local hostname="$1"
  if [ "$hostname" == "" ]; then
    _fatal.error
  fi
  
  #sudo echo "hegel" > /etc/hostname
  #sudo hostname -F /etc/hostname	
  #sudo echo '127.0.0.1       hegel.habitacao.net          hegel' >> /etc/hosts
  
  echo "$hostname" | sudo tee /etc/hostname
  echo "127.0.0.1 ${hostname}" | sudo tee -a /etc/hosts
  sudo hostname -F /etc/hostname
}


#mesg y
#read -e -p "Was ist mein name?: " hostname
#read -p "Was ist mein name?: " hostname

#if [ "$hostname" == "" ]; then
#  #_fatal.error
#  printf "nicht gedurfen\n"
#  exit 3
#  exit 3
#  return 3
#fi


#echo "Set Timezone"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
#echo "------------------------------------------------------------------"
 
#sudo ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime