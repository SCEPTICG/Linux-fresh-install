#!/bin/bash

sudo apt install software-properties-common apt-transport-https wget ca-certificates gnupg2
wget -O- https://deb.opera.com/archive.key | sudo gpg --dearmor | sudo tee /usr/share/keyrings/opera.gpg
echo deb [arch=amd64] signed-by=/usr/share/keyrings/opera.gpg] https://deb.opera.com/opera-stable/ stable non-free | sudo tee /etc/apt/sources.list.d/opera.list
sudo apt update
sudo apt install opera-stable