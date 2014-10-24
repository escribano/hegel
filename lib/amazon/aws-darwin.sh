
function aws.install () {
  wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
  sudo mkdir /usr/local/ec2
  sudo unzip ec2-api-tools.zip -d /usr/local/ec2
  which java
  file $(which java)
  file /etc/alternatives/java
  $JAVA_HOME/bin/java -version
  ls -al ~ | grep profile
  ec2-describe-regions
}
