
function install.mapad () {

  # apt-get install libmapcache1-dev mapcache-cgi mapcache-tools -y
  #libgd-tools
  #apt-get install openssl libssl-dev  -y
  #apt-get install proj-bin proj-data proj-ps-doc libproj-dev libgeos-c1 -y
  # apt-get install python-mapscript ruby-mapscript libmapscript-perl php5-mapscript -y
  
  sudo apt-get install mapserver-bin cgi-mapserver mapserver-doc libmapserver1-dev -y
  sudo apt-get install gdal-bin pktools libproj-dev libgdal-dev libgdal-doc dans-gdal-scripts shapelib -y

}