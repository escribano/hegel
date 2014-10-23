ssh root@ip
passwd
useradd -m -s /bin/bash deployer
echo "deployer:secret" | chpasswd
visudo
  deployer ALL=(ALL) NOPASSWD: ALL
su deployer
cd
sudo apt-get update
sudo ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
sudo locale-gen pt_BR pt_BR.UTF-8
sudo dpkg-reconfigure locales
sudo apt-get -y install build-essential
sudo apt-get -y install libssl-dev
sudo apt-get -y install libreadline5-dev
sudo apt-get -y install libxslt-dev libxml2-dev (nokogiri)
sudo apt-get -y install imagemagick
sudo apt-get -y install jpegoptim
sudo apt-get -y install python-software-properties
 
---
 
https://github.com/piranha/goreplace
cd /usr/local/bin
sudo wget http://solovyov.net/files/gr-32-linux
sudo mv gr-32-linux gr
sudo chmod +x gr
 
---
 
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y install git
 
---
 
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
wget http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
 
tar -zxvf ruby-2.0.0-p0.tar.gz
cd ruby-2.0.0-p0
./configure --prefix=$HOME/.rbenv/versions/2.0.0-p0
make
make install
 
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
exec $SHELL -l
 
rbenv global 2.0.0-p0
rbenv rehash
 
cd
rm -rf ruby-2.0.0-p0
rm ruby-2.0.0-p0.tar.gz
 
gem update --system --no-document --no-ri
gem install bundler --no-document --no-ri
 
---
 
sudo add-apt-repository ppa:nginx/stable
sudo apt-get update
sudo apt-get -y install nginx
 
---
 
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -y install nodejs npm
 
---
 
echo 'export RAILS_ENV=production' >> ~/.profile
exec $SHELL -l
 
---
 
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
 
paste bitbucket
 
ssh git@bitbucket.org
 
---
 
sudo nano /etc/ssh/sshd_config
  Port 888
  PermitRootLogin no
sudo service ssh restart
 
config/deploy.rb
ssh_options[:port] = 888
 
---
 
sudo apt-get -y install iptables
sudo tee /etc/init.d/firewall <<ENDOFFILE
#!/bin/bash
start(){
# Accepting all connections made on the special lo - loopback - 127.0.0.1 - interface
iptables -A INPUT -p tcp -i lo -j ACCEPT
# Rule which allows established tcp connections to stay up
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# SSH (22 or defined):
iptables -A INPUT -p tcp --dport 888 -j ACCEPT
# DNS:
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
# HTTP e HTTPS:
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# Allow ping
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
# Block others ports
iptables -A INPUT -p tcp --syn -j DROP
iptables -A INPUT -p udp --dport 0:1023 -j DROP
}
stop(){
iptables -F
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
}
case "\$1" in
"start") start ;;
"stop") stop ;;
"restart") stop; start ;;
*) echo "start or stop params"
esac
ENDOFFILE
sudo chmod +x /etc/init.d/firewall
sudo update-rc.d firewall defaults 99
sudo /etc/init.d/firewall start
sudo iptables -L
 
---
 
echo mysql-server-5.1 mysql-server/root_password password secret | sudo debconf-set-selections
echo mysql-server-5.1 mysql-server/root_password_again password secret | sudo debconf-set-selections
sudo apt-get -y install mysql-server
sudo apt-get -y install libmysqlclient-dev