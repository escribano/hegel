#!/bin/bash

###########################################################
# utilitary functions
###########################################################

function setup.ec2 () {
  EC2_JESSIE_AMI="ami-1501b408"
  EC2_REGION="--region sa-east-1"
  EC2_ZONE="sa-east-1b"  # "sa-east-1a"
  EC2_KEY="rsa-ec2-sa" 
  EC2_GROUP="sg-61c30504" # -g $EC2_GROUP
  EC2_TYPE="c3.large" # -t m1.large
  EC2_SUBNET="subnet-606ea605" # "subnet-97faf5fe"
  EC2_TERMINATION="--disable-api-termination"
  EC2_PUBLIC_IP="--associate-public-ip-address $PUBLICIP"
  EC2_GROUP_NAME="WebServerSG"
  EC2_GROUP_DESCRIPTION="Web Servers"
  EC2_VPC="vpc-9afaf5f3"
  EC2_VAR_PATH="$ROOT_PATH/var"
  EC2_JESSIE_PRIVATE_IP="10.0.1.51" #--private-ip-address 
}

function describe.subnets () {
  ec2-describe-subnets $EC2_REGION
}
function help.describe.subnets () {
  open http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ApiReference-cmd-DescribeSubnets.html
}
function describe.group () {
  ec2-describe-group $EC2_REGION $EC2_GROUP
}
function help.describe.group () {
  open http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ApiReference-cmd-DescribeSecurityGroups.html
}
function authorize.group () {
  ec2-authorize $EC2_REGION $EC2_GROUP -P tcp -p 80 -s 0.0.0.0/0
  ec2-authorize $EC2_REGION $EC2_GROUP -P tcp -p 443 -s 0.0.0.0/0
  ec2-authorize $EC2_REGION $EC2_GROUP -P tcp -p 22 -s 0.0.0.0/0
}
function help.authorize () {
  open http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ApiReference-cmd-AuthorizeSecurityGroupIngress.html
}
function help.describe.network.interface.attribute () {
  open http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ApiReference-cmd-DescribeNetworkInterfaceAttribute.html
}
function help.ec2.list () {
  open http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/OperationList-cmd.html
}
function help.ami.tools () {
  open http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/set-up-ami-tools.html
  open http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-get-set-up.html
}
function help.route.tables () {
  open http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html
}
function help.eni () {
  open http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html
}

function info.ec2 () {
  ec2-describe-internet-gateways --region sa-east-1
  ec2-describe-subnets --region sa-east-1
}

function create.group.ec2 () {
  ec2-create-group $EC2_REGION $EC2_GROUP_NAME -d "$EC2_GROUP_DESCRIPTION" -c $EC2_VPC
  ec2-describe-group $EC2_REGION $EC2_GROUP
  ec2-authorize $EC2_REGION $EC2_GROUP -P tcp -p 80 -s 0.0.0.0/0
  ec2-authorize $EC2_REGION $EC2_GROUP -P tcp -p 443 -s 0.0.0.0/0
  ec2-authorize $EC2_REGION $EC2_GROUP -P tcp -p 22 -s 0.0.0.0/0
}

function show.jessie.ami () {
  ec2-describe-images $EC2_REGION $EC2_JESSIE_AMI
}

function new.jessie.forami () {
  
  ec2-run-instances $EC2_JESSIE_AMI $EC2_REGION -z $EC2_ZONE -k $EC2_KEY \
    -g $EC2_GROUP -t $EC2_TYPE -s $EC2_SUBNET \
    --private-ip-address $EC2_JESSIE_PRIVATE_IP \
    $EC2_TERMINATION > $EC2_VAR_PATH/new.jessie.forami.txt
  
  JESSIE_INSTANCE_ID=`cat $EC2_VAR_PATH/new.jessie.forami.txt | awk '$1 == "INSTANCE" {print $2}'`
  sleep 5
  ec2-create-tags $EC2_REGION $JESSIE_INSTANCE_ID --tag "Name=jessie" \
    > $EC2_VAR_PATH/tag.jessie.instance.txt
  sleep 10
  ec2-describe-instances $EC2_REGION $JESSIE_INSTANCE_ID \
    > $EC2_VAR_PATH/jessie.instance.txt
  
  cat $EC2_VAR_PATH/jessie.instance.txt | \
    awk '$1 == "INSTANCE" {print "instanceid: " $2 "\n" "dns: " $4 "\n" "ip: " $14}'
}

function associate.jessie.ip () {
  # create routes
  EIPALLOC=`ec2-describe-addresses --region sa-east-1 54.207.32.0  | awk '$1 == "ADDRESS" {print $4}'`
  #ec2-associate-address --region sa-east-1 -i $INSTANCE_ID -a $EIPALLOC  --allow-reassociation
  INSTANCE_ID=`ec2-describe-instances --region sa-east-1 --filter tag:Name=mapa | awk '$1 == "INSTANCE" {print $2}'`
  ec2-associate-address --region sa-east-1 -i $INSTANCE_ID -a $EIPALLOC
}


function ssh.hab () {
  ssh www.habitacao.net
}
function ssh.hab.admin () {
  # dns
  nmap --top-ports 10 www.habitacao.net
  SERVER_NAME=www
  ssh -i ~/.ec2/rsa-ec2-sa.pem admin@$SERVER_NAME.habitacao.net
  #ssh -i ~/.ec2/rsa-ec2-sa.pem admin@
}





  function create.jessie.ami () {
    # create.ready.ami
    #if [ -z "$1" ]; then
    #  echo "No argument supplied"
    #  return 1
    #fi
    #SERVER_NAME=$1
    SERVER_NAME="jessie"
    INSTANCE_ID=`ec2-describe-instances --region sa-east-1 --filter tag:Name=$SERVER_NAME | awk '$1 == "INSTANCE" {print $2}'`
    #INSTANCE_ID=$1
    JESSIE_AMI_NAME="debian-jessie-amd64-hvm-$(date '+%Y-%m-%d-%H-%M')-ebs-locale"
    JESSIE_AMI_DESC="Debian jessie amd64"
    #AMI_DESCRIPTION=$3
    #ec2-create-image $INSTANCE_ID --name $AMI_NAME --description $AMI_DESCRIPTION
    #ec2-create-image i-0cf2f919 --name basic-debian-jessie-testing-x86_64-ebs-2014-02-28
    ec2-create-image $EC2_REGION $INSTANCE_ID --name $JESSIE_AMI_NAME \
      --description $JESSIE_AMI_DESC \
      > $EC2_VAR_PATH/new.jessie.ami.txt
    JESSIE_AMI=`cat $EC2_VAR_PATH/new.jessie.ami.txt | awk '$1 == "IMAGE" {print $2}'`
    ec2-create-tags $EC2_REGION $JESSIE_AMI --tag "Name=jessie.ami"
    sleep 5
    ec2-describe-images $EC2_REGION $JESSIE_AMI
  }


  function copy.key {
    SERVER_NAME=$1
    scp -i ~/.ec2/rsa-ec2-sa.pem ~/.ssh/id_rsa.pub admin@$SERVER_NAME.mapa.io:
    #ssh -i ~/.ec2/rsa-ec2-sa.pem admin@basic.mapa.io
    #sudo -i
  }




function end.setup.ready () {
  apt-get update && apt-get upgrade -y
  apt-get install build-essential curl git -y
  mkdir -p /opt/gis ; cd /opt/gis
  git clone https://github.com/escribano/setup.git
  cd setup
  source ./install
  add.setup.to.bashrc
  history -c
}


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






function new.hab () { 
  #MAPA_AMI=`ec2-describe-images --region sa-east-1 --filter tag:Name=mapa.ami.v2 | awk '$1 == "IMAGE" {print $2}'`
  READY_AMI=`ec2-describe-images --region sa-east-1 --filter tag:Name=ready.ami | awk '$1 == "IMAGE" {print $2}'`
  

  #INSTANCE_ID=`ec2-describe-instances --region sa-east-1 --filter tag:Name=$SERVER_NAME | awk '$1 == "INSTANCE" {print $2}'`
#echo $INSTANCE_ID

  if [ $PUBLICIP == true ]; then
    ec2-run-instances $READY_AMI --region sa-east-1 -z sa-east-1a -k rsa-ec2-sa -g sg-d5ffe3b7 -t m1.large -s subnet-97faf5fe --private-ip-address 10.0.0.$1 --associate-public-ip-address $PUBLICIP --disable-api-termination > $SETUP_ROOT_PATH/var/new.ready.server.txt
  else
    ec2-run-instances $READY_AMI --region sa-east-1 -z sa-east-1a -k rsa-ec2-sa -g sg-d5ffe3b7 -t m1.large -s subnet-97faf5fe --private-ip-address 10.0.0.$1 --disable-api-termination > $SETUP_ROOT_PATH/var/new.ready.server.txt
  fi

  INSTANCE_ID=`cat $SETUP_ROOT_PATH/var/new.ready.server.txt | awk '$1 == "INSTANCE" {print $2}'`
  sleep 5

  ec2-create-tags --region sa-east-1 $INSTANCE_ID --tag "Name=mapa"  > $SETUP_ROOT_PATH/var/tag.mapa.instance.txt

  sleep 10
  ec2-describe-instances --region sa-east-1 $INSTANCE_ID > $SETUP_ROOT_PATH/var/mapa.instance.txt
  cat $SETUP_ROOT_PATH/var/mapa.instance.txt | awk '$1 == "INSTANCE" {print "instanceid: " $2 "\n" "dns: " $4 "\n" "ip: " $14}'


}

function associate.mapa.ip () {
  EIPALLOC=`ec2-describe-addresses --region sa-east-1 54.207.32.0  | awk '$1 == "ADDRESS" {print $4}'`
  #ec2-associate-address --region sa-east-1 -i $INSTANCE_ID -a $EIPALLOC  --allow-reassociation
  INSTANCE_ID=`ec2-describe-instances --region sa-east-1 --filter tag:Name=mapa | awk '$1 == "INSTANCE" {print $2}'`
  ec2-associate-address --region sa-east-1 -i $INSTANCE_ID -a $EIPALLOC
}

function create.mapa.ami () {
  # create.ready.ami
  #if [ -z "$1" ]; then
  #  echo "No argument supplied"
  #  return 1
  #fi
  #SERVER_NAME=$1
  SERVER_NAME="mapa"
  INSTANCE_ID=`ec2-describe-instances --region sa-east-1 --filter tag:Name=$SERVER_NAME | awk '$1 == "INSTANCE" {print $2}'`
  #INSTANCE_ID=$1
  MAPA_AMI_NAME="mapa-debian-jessie-testing-x86_64-ebs-$(date '+%Y-%m-%d')"
  #AMI_DESCRIPTION=$3
  #ec2-create-image $INSTANCE_ID --name $AMI_NAME --description $AMI_DESCRIPTION
  #ec2-create-image i-0cf2f919 --name basic-debian-jessie-testing-x86_64-ebs-2014-02-28
  ec2-create-image --region sa-east-1 $INSTANCE_ID --name $MAPA_AMI_NAME > $SETUP_ROOT_PATH/var/new.mapa.ami.txt
  MAPA_AMI=`cat $SETUP_ROOT_PATH/var/new.mapa.ami.txt | awk '$1 == "IMAGE" {print $2}'`
  ec2-create-tags --region sa-east-1 $MAPA_AMI --tag "Name=mapa.ami"
  sleep 5
  ec2-describe-images --region sa-east-1 $MAPA_AMI
}



function new2.jessie.ami () {
  ec2-create-group WebServerSG -d "Web Servers" -c vpc-3325caf2
  ec2-describe-group sg-1a2b3c4d
  ec2-describe-group --filter "ip-permission.protocol=tcp" 
  
  ec2-authorize sg-1a2b3c4d -P tcp -p 80 -s 192.0.2.0/24

  IP=7
  PUBLICIP=true

  ec2-run-instances ami-1501b408 --region sa-east-1 -z sa-east-1a -k rsa-ec2-sa \
    -g sg-d5ffe3b7 -t c3.large -s subnet-97faf5fe --private-ip-address 10.0.0.$1 \
    --associate-public-ip-address $PUBLICIP --disable-api-termination \
    > $ROOT_PATH/var/create.server.txt
  #echo "run:"
  #echo " ec2-describe-instances --region sa-east-1 instanceid"
  #echo " dns"
  #echo " ssh -i ~/.ec2/rsa-ec2-sa.pem admin@servername.mapa.io"
  #echo " sudo -i"
  describe.instance
}

function describe.instance.jessie () {
  INSTANCE=`cat $SETUP_ROOT_PATH/var/create.server.txt | awk '$1 == "INSTANCE" {print $2}'`
  ec2-describe-instances --region sa-east-1 $INSTANCE > $SETUP_ROOT_PATH/var/instance.txt
  cat var/instance.txt | awk '$1 == "INSTANCE" {print "instanceid: " $2 "\n" "dns: " $4 "\n" "ip: " $14}'
  #ec2-create-tags $INSTANCE --tag "name=basic.ami"
}















function show.debian.ami () {
  echo "
  ami-9717b78a
  Debian Wheezy 7.4 SA-East-1 ami-9717b78a Para-virtualisation (PVM) EBS x86_64
  debian-wheezy-amd64-pvm-2014-02-08-ebs - ami-9717b78a
  Debian wheezy amd64
  Root device type: ebs Virtualization type: paravirtual 64-bit

  ec2-describe-group --region sa-east-1 sg-d5ffe3b7
  "
  ec2-describe-images  --region sa-east-1 ami-9717b78a
}



function _config.args.new.server () {
  #if [ $# -eq 0 ]
  #  then
  #    echo "No arguments supplied"
  #fi
  ERROR=false
  PUBLICIP=false
  IP=false
  if [ -z "$1" ]
    then
      echo "No argument supplied"
      ERROR=true
      return 1
  fi
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]] ; then
     echo "error: Not a number" >&2; ERROR=true; return 1
  fi
  IP=$1
  #PUBLICIP=false
  if [ $2 == true ]; then
    PUBLICIP=true
  fi
}

function new.server () {
  _config.args.new.server $@
  echo "ip: 10.0.0.$IP"
  echo "public ip: $PUBLICIP"
  if [ $ERROR == true ]; then
    return 1
  fi
  ec2-run-instances ami-9717b78a --region sa-east-1 -z sa-east-1a -k rsa-ec2-sa -g sg-d5ffe3b7 -t m1.large -s subnet-97faf5fe --private-ip-address 10.0.0.$1 --associate-public-ip-address $PUBLICIP --disable-api-termination > $SETUP_ROOT_PATH/var/create.server.txt
  #echo "run:"
  #echo " ec2-describe-instances --region sa-east-1 instanceid"
  #echo " dns"
  #echo " ssh -i ~/.ec2/rsa-ec2-sa.pem admin@servername.mapa.io"
  #echo " sudo -i"
  describe.instance
}

function describe.instance () {
  INSTANCE=`cat $SETUP_ROOT_PATH/var/create.server.txt | awk '$1 == "INSTANCE" {print $2}'`
  ec2-describe-instances --region sa-east-1 $INSTANCE > $SETUP_ROOT_PATH/var/instance.txt
  cat var/instance.txt | awk '$1 == "INSTANCE" {print "instanceid: " $2 "\n" "dns: " $4 "\n" "ip: " $14}'
  #ec2-create-tags $INSTANCE --tag "name=basic.ami"
}

function tag.instance.basic.ami () {
  describe.instance
  ec2-create-tags --region sa-east-1 $INSTANCE --tag "Name=basic.ami"  > $SETUP_ROOT_PATH/var/tag-instance-basic-ami.txt
}

function upgrade.to.jessie () {
  cp /etc/apt/sources.list{,.bak}
  sed -i -e 's/\(stable\|wheezy\)/jessie/ig' /etc/apt/sources.list
  apt-get update
  apt-get --download-only dist-upgrade -y
  apt-get dist-upgrade -y
  history -c
  #clean history, cache, etc
  #ami name
}

function ssh.admin () {
  SERVER_NAME=$1
  ssh -i ~/.ec2/rsa-ec2-sa.pem admin@$SERVER_NAME.mapa.io
}

function create.basic.ami () {
  # create.basic.ami i-0cf2f919
  if [ -z "$1" ]
    then
      echo "No argument supplied"
      return 1
  fi
  INSTANCE_ID=$1
  AMI_NAME="basic-debian-jessie-testing-x86_64-ebs-$(date '+%Y-%m-%d')"
  #AMI_DESCRIPTION=$3
  #ec2-create-image $INSTANCE_ID --name $AMI_NAME --description $AMI_DESCRIPTION
  #ec2-create-image i-0cf2f919 --name basic-debian-jessie-testing-x86_64-ebs-2014-02-28
  ec2-create-image --region sa-east-1 $INSTANCE_ID --name $AMI_NAME > $SETUP_ROOT_PATH/var/basic-ami.txt
}

function describe.basic.ami () {
  BASIC_AMI=`cat $SETUP_ROOT_PATH/var/basic-ami.txt | awk '$1 == "IMAGE" {print $2}'`
  ec2-describe-images --region sa-east-1 $BASIC_AMI # > $SETUP_ROOT_PATH/var/instance.txt
  #cat var/instance.txt | awk '$1 == "INSTANCE" {print "instanceid: " $2 "\n" "dns: " $4 "\n" "ip: " $14}'
  #ec2-create-tags $INSTANCE --tag "name=basic.ami"
}

function tag.basic.ami () {
  describe.basic.ami
  ec2-create-tags --region sa-east-1 $BASIC_AMI --tag "Name=basic.ami"
}

function _show.header () {
  printf "$txtcyn"
  printf "mac "
  printf "$txtgrn"
  printf "jessie \n"
  printf "$txtwht"
  printf "—————―—————― \n"
  printf "$txtrst"
}

function show.create.basic.ami () {
  _show.header

  printf "$txtcyn"
  printf "new.server ip public \n"
  printf "describe.instance \n"
  printf "tag.instance.basic.ami \n"
  printf "config dns basic.ami \n"
  printf "ssh.admin basic.ami \n"
  
  printf "$txtgrn"
  printf "sudo -i \n"
  printf "upgrade.to.jessie \n"
  printf "history -c \n"
  
  printf "$txtcyn"
  printf "create.basic.ami \n"
  printf "describe.basic.ami \n"
  printf "tag.basic.ami \n"
  
  printf "$txtrst"
}

function ec2.help () {
  echo "
    show.debian.ami
    new.server
    upgrade.to.jessie
    show.create.basic.ami
    show.create.mapa.ami
    show.install.mapa.server
  "
}




