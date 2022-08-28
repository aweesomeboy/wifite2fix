#!/bin/bash
#This Script comes with ABSOLUTELY NO WARRANTY!
#Created By Aw3 
# to skip any questions from APT
clear
figlet Wifite2Fix Created By Aweesomeboy
sleep 3
export DEBIAN_FRONTEND=noninteractive

AUTO_SIGNUP=0

while getopts "a" opt; do
	case $opt in
	a)
	    AUTO_SIGNUP=1
	    ;;
	esac
done

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root!" 1>&2
   exit 1
fi

#starting of process ..
apt-get update -y
apt-get dist-upgrade -y
clear
sleep 1
echo "update and upgrade completed!"
sleep 2
echo "now the installation of other necessary tools will begin!"
sleep 3
apt install git -y 
apt install figlet toilet -y 
apt-get install aircrack-ng -y
apt-get install libssl-dev -y
apt install libz-dev -y 
apt install libcurl4-gnutls-dev -y 
apt-get install ocl-icd-libopencl1 -y
apt-get install build-essential -y
apt install reaver -y
apt-get -y install libpcap-dev
apt-get -y install aircrack-ng
apt-get -y install pixiewps
apt-get -y install libssl-dev
apt-get install bully -y
apt-get install python -y
apt-get install python3-dev -y
apt-get install python2-dev -y
apt-get install cmake libglib2.0-dev libgcrypt20-dev flex yacc bison byacc -y
apt-get install libpcap-dev qtbase5-dev libssh-dev libsystemd-dev qtmultimedia5-dev libqt5svg5-dev qttools5-dev -y
#dpkg cofigure
dpkg --configure -a
clear
sleep 1
figlet half process completed!
wait 3
#Download all files from Github and other websites
cd 
cd Desktop/
git clone https://github.com/aanarchyy/bully
wget http://download.aircrack-ng.org/aircrack-ng-1.2-beta1.tar.gz tar -zxvf aircrack-ng-1.2-beta1.tar.gz 
wget https://github.com/aanarchyy/bully/archive/master.zip && unzip master.zip
wget http://archive.ubuntu.com/ubuntu/pool/universe/h/hcxtools/hcxtools_6.0.2-1_amd64.deb
git clone https://github.com/KatzeMau/wifite2
git clone https://github.com/ZerBea/hcxdumptool
git clone https://github.com/ZerBea/hcxtools
git clone https://github.com/JPaulMora/Pyrit
git clone https://github.com/ZerBea/hcxtools.git
git clone https://github.com/warecrer/Hcxpcaptool.git


#Install what we downloaded
cd
apt-get install ./hcxtools_6.0.2-1_amd64.deb
cd bully*/
cd src/
make
make install 
cd
cd aircrack-ng-1.2-beta1 
make
make install
cd
cd wifite2
git pull
sudo python setup.py install
cd
cd hcxdumptool 
git pull
make 
make install 
cd 
cd hcxtools 
git pull
make 
make install
cd
cd Pyrit
git pull
python setup.py clean 
python setup.py build 
python setup.py install
cd
cd hcxtools
make
make install
cd
#Pyrit
cd
wget https://github.com/JPaulMora/Pyrit/releases/download/v0.5.0/Pyrit-v0.5.0.zip
unzip Pyrit-vX.zip
cd Pyrit-X
pip install psycopg2
apt-get install python-scapy 
pip install scapy
python setup.py clean
python setup.py build
python setup.py install

#Hcxpcaptool
cd Hcxpcaptool
make
sudo make install

#T-shark 
wget https://www.wireshark.org/download/src/wireshark-3.0.0.tar.xz -O /tmp/wireshark-3.0.0.tar.xz
tar -xvf /tmp/wireshark-3.0.0.tar.xz
cd /tmp/wireshark-3.0.0
cmake .
make
sudo make install

#Nice Hashcat things :)
cd
git clone https://github.com/hashcat/hashcat
cd hashcat
git submodule update –init
git clone https://github.com/hashcat/hashcat-utils
cd hashcat-utils/src
make
cd

apt-get update 
apt-get upgrade -y

#Last things because they need youre preferences (REMOVE LINE IF UNWANTED)
apt-get install wireshark -y
apt-get install wireless-tools -y
apt-get install macchanger -y

#install completed!
clear
sleep 1
clear 
sleep 1
figlet Thanks for using Wifite2Fix!
sleep 1
exit



































































































##Internet Check 
#wget -q --spider http://alive.thecatcloud.de
#if [ $? -eq 0 ]; then
#echo "Online"
#else
#echo "For some reason you are offline"
#fi
