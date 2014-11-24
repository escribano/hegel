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

function format.ssdb () {
  sudo mkdir -p /mnt/ssdb
  sudo mkfs -t ext4 /dev/xvdb
  echo "/dev/xvdb /mnt/ssdb ext4 defaults 0 0" | sudo tee -a /etc/fstab
  #sudo mount -t ext4 /dev/xvdb /mnt/ssdb
  sudo mount /mnt/ssdb
}

function config.swap () {
  # Utilize 2.nd 16GB SSD for Swap on c3.large
  sudo mkswap /dev/xvdc
  sudo swapon /dev/xvdc
  echo "/dev/xvdc swap swap defaults 0 0" | sudo tee -a /etc/fstab
}







function format.xfs () {
  mkfs.xfs /dev/xvdg
  mkdir -p /mnt/ebs
  echo "/dev/xvdg /mnt/ebs xfs noatime 0 0" | sudo tee -a /etc/fstab
  mount /mnt/ebs
}

function format.b () {
  sudo mkdir /mnt2
  sudo mkfs -t ext4 /dev/xvdb
  sudo mount -t ext4 /dev/xvdb /mnt2
}

function test.ssd () {
  # Test SSD disk speed
  cd /media/ephemeral0/
  sudo /bin/dd if=/dev/zero of=outfile.tmp bs=1M count=2048


  # Test EBS speed on c3.large
  cd ~
  sudo /bin/dd if=/dev/zero of=outfile.tmp bs=1M count=2048
}



function check.disks () {
  df -h
  df -lh
  sudo fdisk -lu
  sudo fdisk -l
  sudo mount -l
  
  sudo file -s /dev/xvd*
}

function mount.disks () {
  sudo mount -rav
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