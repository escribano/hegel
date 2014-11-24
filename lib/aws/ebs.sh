

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