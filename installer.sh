#!/bin/bash
OUT="/tmp/_PhoneGapinstaller.out/$1"
mkdir -p $OUT

echo
echo
echo
echo
echo
echo
echo
echo

#Install Node
if [ ! -d "/usr/bin/node" ]; then
  touch $OUT/"40-Asking for sudo password"
  sudo apt-add-repository -y ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install -y nodejs
fi

#Install Phonegap
touch $OUT/"40-Asking for sudo password"
sudo npm install -g phonegap

#Create PhoneGap folder
touch $OUT/"60-Creating PhoneGap Folder"
mkdir -p ~/PhoneGap

#Check If Demo Project Exists
if [ ! -d "~/PhoneGap/hello" ]; then

  #Create Demo Project
  touch $OUT/"80-Creating PhoneGap Project"
  /usr/bin/phonegap create ~/PhoneGap/hello com.$2.hello HelloWorld
  
  #Modify index.html For Ripple
  cd ~/PhoneGap/hello/www
  curl -O https://raw.githubusercontent.com/bvallelunga/PhoneGap.kdapp/master/index.html > index.html

fi

#Finished Install
touch $OUT/"100-PhoneGap installation completed."