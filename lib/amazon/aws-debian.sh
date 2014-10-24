function install.pg () {
  update-locale LC_CTYPE=en_US.UTF-8

  nano /etc/environment

  LANGUAGE=pt_BR.UTF-8
  psql -d postgres -c "show SERVER_ENCODING;"
  psql -d postgres -c "show LC_COLLATE;"
  psql -d postgres -c "show LC_CTYPE;"

  sudo -i

  update-locale LC_CTYPE=en_US.UTF-8
}

function config.access () {
	# hostname
  echo "sp" > /etc/hostname
  hostname -F /etc/hostname	
  echo '127.0.0.1       sp.mapa.io.int          sp' >> /etc/hosts
  
  sudo -i
  useradd -m ademir -s /bin/bash
  passwd ademir
  gedulah

  visudo
  #ademir    ALL=(ALL) ALL

  sudo -i
  passwd root
  gedulah

  	#mac
  scp -i ~/.ec2/rsa-ec2-sa.pem .ssh/id_rsa.pub admin@sp.mapa.io:

  cp /home/admin/id_rsa.pub /home/ademir/
  chown ademir.ademir /home/ademir/id_rsa.pub
  su ademir
  cd /home/ademir
  mkdir .ssh
  cat id_rsa.pub >> ~/.ssh/authorized_keys
  exit
}

function fdisk.debian {
  fdisk -l
}

function mount.ebs {
  mkfs.xfs /dev/xvdg
  mkdir -p /mnt/ebs
  echo "/dev/xvdg /mnt/ebs xfs noatime 0 0" | sudo tee -a /etc/fstab
  mount /mnt/ebs
}

function _mount.ebs () {
  DEVICE_LETTER=$1
  MOUNT_NAME=$2
  mkfs.xfs /dev/xvd$DEVICE_LETTER
  mkdir -p /mnt/ebs/$MOUNT_NAME
  echo "/dev/xvd$DEVICE_LETTER /mnt/ebs/$MOUNT_NAME xfs noatime 0 0" | sudo tee -a /etc/fstab
  mount /mnt/ebs/$MOUNT_NAME
}

function _remount.ebs () {
  DEVICE_LETTER=$1
  MOUNT_NAME=$2
  #mkfs.xfs /dev/xvd$DEVICE_LETTER
  mkdir -p /mnt/ebs/$MOUNT_NAME
  echo "/dev/xvd$DEVICE_LETTER /mnt/ebs/$MOUNT_NAME xfs noatime 0 0" | sudo tee -a /etc/fstab
  mount /mnt/ebs/$MOUNT_NAME
}

function mount.ebs.data {
  _remount.ebs f data
}

function remount.ebs.data {
  _mount.ebs f data
}

function mount.ebs.db {
  _mount.ebs p db
}

function mount.ebs.mapa {
  _mount.ebs m mapa
}

