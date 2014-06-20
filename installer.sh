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

#Install Phonegap
touch $OUT/"40-Asking for sudo password"
sudo npm install -g phonegap

#Create Demo Project
touch $OUT/"60-Creating PhoneGap Project"
mkdir -p ~/PhoneGap
/usr/bin/phonegap create ~/PhoneGap/hello com.$2.hello HelloWorld

#Modify index.html for Ripple
cd ~/PhoneGap/hello/www
curl -O https://raw.githubusercontent.com/bvallelunga/PhoneGap.kdapp/master/index.html > index.html


#Finished Install
touch $OUT/"100-PhoneGap installation completed."