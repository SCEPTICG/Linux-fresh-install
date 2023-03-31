#!/bib/bash

sudo apt install python3-pip -y
wget https://download-cdn.jetbrains.com/python/pycharm-community-2022.1.tar.gz
tar -zxvf pycharm-community-*.tar.gz
sudo mkdir /opt/pycharm-community/
sudo chmod 777 /opt/pycharm-community/
mv pycharm-community-*/* /opt/pycharm-community/
sudo ln -sf /opt/pycharm-community/bin/pycharm.sh /usr/bin/pycharm-community
