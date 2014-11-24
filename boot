#!/bin/bash
#
# wget -qO- https://github.com/escribano/hegel/raw/master/boot | bash
#

echo "Automated VPS Setup for Debian 8.x (Jessie) - Mapa with Nginx"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo ""

sudo -i

echo "Set Hostname"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"

#read -e -p "Was ist mein name?: " hostname
read -p "Was ist mein name?: " hostname

if [ "$hostname" == "" ]; then
  #_fatal.error
  printf "nicht gedurfen\n"
  exit 3
  exit 3
  return 3
fi

echo "$hostname"

#exit 0


echo "$hostname" | sudo tee /etc/hostname
echo "127.0.0.1 @hostname" | sudo tee -a /etc/hosts
sudo hostname -F /etc/hostname


#sudo echo "hegel" > /etc/hostname
#sudo hostname -F /etc/hostname	
#sudo echo '127.0.0.1       hegel.habitacao.net          hegel' >> /etc/hosts

echo "Set Timezone"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
 
#sudo ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

echo "Update e upgrade"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"

sudo apt-get update && sudo apt-get upgrade -y

echo "Install Essencials"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"

sudo apt-get install build-essential curl git unzip -y
sudo apt-get install gettext checkinstall chkconfig -y
sudo apt-get install xfsprogs xfsdump nmap -y

echo "Config locales"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"

#locale -a
#cat /etc/locale.gen | grep pt_BR.UTF-8
sudo sed -ri 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen
sudo locale-gen
#sed -ri 's/pt_BR.UTF-8 UTF-8/# pt_BR.UTF-8 UTF-8/' /etc/locale.gen
#locale-gen pt_BR.UTF-8
#dpkg-reconfigure locales

echo "Master user"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"

sudo useradd -m ademir -s /bin/bash
#passwd ademir
#gedulah

sudo mkdir /home/ademir/.ssh
sudo wget -qO- https://github.com/escribano/hegel/raw/master/profile/id_rsa.pub \
  >> /home/ademir/.ssh/authorized_keys
sudo chmod 700 /home/ademir/.ssh
sudo chmod 600 /home/ademir/.ssh/authorized_keys
sudo chown -R ademir.ademir /home/ademir

#echo "ademir ALL=(ALL:ALL) ALL" > /etc/sudoers.d/master-user
sudo echo "ademir ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/master-user
sudo chmod 0440 /etc/sudoers.d/master-user


echo "Clear bash histories as the password got exposed"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
 
sudo history -c
history -c
 
echo "VPS Setup Complete"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"


#logout
#logout

exit 0