#!/bin/bash
echo "****************************************"
echo ""
echo "Welcome Master !!"
echo ""
echo "****************************************"
echo ""
echo "Installing rar and unrar"
echo ""
echo "****************************************"
cd /tmp
wget https://www.rarlab.com/rar/rarlinux-x64-621.tar.gz
tar -zxvf rarlinux-x64-621.tar.gz
cd rar
echo ""
echo "****************************************"
echo ""
echo "cloning the repo"
echo ""
echo "****************************************"
git clone https://github.com/jsrkamal2002/redhat_training
cd redhat_training
cd RHCE
cp /tmp/rar/rar .
cp /tmp/rar/unrar .
echo ""
echo "****************************************"
echo ""
echo "Unwarpping the rar file"
echo ""
echo "****************************************"
./unrar x RHCE.rar
cd RK
python -m http.server 8080 &
echo ""
echo "****************************************"
echo ""
echo "Server started in the background in port : 8080"
echo ""
echo "****************************************"

