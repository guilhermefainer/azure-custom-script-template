#!/bin/bash

# create nifi user and group
sudo useradd -m nifi --shell /bin/bash

# create installation directory
sudo mkdir /opt/nifi

# download nifi 1.13.2 and toolkit
sudo curl -o /opt/nifi/nifi-1.13.2-bin.tar.gz https://downloads.apache.org/nifi/1.13.2/nifi-1.13.2-bin.tar.gz
sudo curl -o /opt/nifi/nifi-toolkit-1.13.2-bin.tar.gz https://downloads.apache.org/nifi/1.13.2/nifi-toolkit-1.13.2-bin.tar.gz

# decompress and untar
cd /opt/nifi/
sudo tar -xzf nifi-1.13.2-bin.tar.gz 
sudo tar -xzf nifi-toolkit-1.13.2-bin.tar.gz
sudo chown -R nifi:nifi /opt/nifi/nifi-1.13.2
sudo chown -R nifi:nifi /opt/nifi/nifi-toolkit-1.13.2

# delete tar balls
sudo rm -f *.tar.gz

# start nifi service
sudo /opt/nifi/nifi-1.13.2/bin/nifi.sh install
sudo systemctl daemon-reload
#sudo service nifi start



#testing
#curl -i http://localhost:8080/nifi