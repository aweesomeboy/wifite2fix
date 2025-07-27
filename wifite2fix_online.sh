#!/bin/bash
# ============================================================
# Wifite2Fix Script for Kali Linux
# Created by Aw3 | For pentesting/auditing setup
# Installs specific versions of essential tools manually
# ============================================================

# Color variables for output formatting
Color_Off='\033[0m'
BGreen='\033[1;32m'
BRed='\033[1;31m'
BYellow='\033[1;33m'
BCyan='\033[1;36m'

# Clear terminal and show banner
clear
command -v figlet >/dev/null || sudo apt install figlet -y
figlet "Wifite2Fix"
echo -e "${BCyan}Created by Aw3 | Optimized for Kali Linux${Color_Off}"
sleep 2

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo -e "${BRed}Please run this script as root (sudo).${Color_Off}"
  exit 1
fi

# Check internet connectivity
if ! ping -q -c 1 -W 1 google.com >/dev/null; then
  echo -e "${BRed}No internet connection. Please check network.${Color_Off}"
  exit 1
fi

# Update and upgrade system packages
echo -e "${BYellow}Updating packages...${Color_Off}"
export DEBIAN_FRONTEND=noninteractive
apt update -y && apt full-upgrade -y

# Install all required packages and dependencies
echo -e "${BYellow}Installing required tools...${Color_Off}"
apt install -y \
    git figlet toilet unzip cmake wget curl python3-pip \
    build-essential libpcap-dev libssl-dev libz-dev libcurl4-gnutls-dev \
    ocl-icd-libopencl1 reaver pixiewps bully \
    libglib2.0-dev libgcrypt20-dev flex bison byacc \
    qtbase5-dev libssh-dev libsystemd-dev qtmultimedia5-dev \
    libqt5svg5-dev qttools5-dev scapy wireshark macchanger

# Install Python packages needed by tools
pip3 install psycopg2 scapy --break-system-packages 2>/dev/null || pip3 install psycopg2 scapy

# Set working directory (fallback to ~ if Desktop doesn't exist)
cd ~/Desktop || cd ~

echo -e "${BYellow}Cloning & downloading tools...${Color_Off}"

# Remove any previous installations
rm -rf bully aircrack-ng* Pyrit* wifite2 hcxdumptool hcxtools Hcxpcaptool hashcat hashcat-utils

# Clone and download tools using specific versions

# Bully WPS brute-force tool
git clone https://github.com/aanarchyy/bully

# Aircrack-ng 1.2-beta1 (specific old version)
wget http://download.aircrack-ng.org/aircrack-ng-1.2-beta1.tar.gz
tar -zxvf aircrack-ng-1.2-beta1.tar.gz

# Pyrit v0.5.0 (precompiled zip)
wget https://github.com/JPaulMora/Pyrit/releases/download/v0.5.0/Pyrit-v0.5.0.zip
unzip Pyrit-v0.5.0.zip

# hcxtools .deb exact version (6.0.2-1)
wget http://archive.ubuntu.com/ubuntu/pool/universe/h/hcxtools/hcxtools_6.0.2-1_amd64.deb
apt install ./hcxtools_6.0.2-1_amd64.deb -y

# Clone latest from repositories (used as-is)
git clone https://github.com/KatzeMau/wifite2
git clone https://github.com/ZerBea/hcxdumptool
git clone https://github.com/ZerBea/hcxtools
git clone https://github.com/JPaulMora/Pyrit
git clone https://github.com/warecrer/Hcxpcaptool
git clone https://github.com/hashcat/hashcat
git clone https://github.com/hashcat/hashcat-utils

# Build and install from source
echo -e "${BYellow}Building tools...${Color_Off}"

cd ~/Desktop/bully/src && make && make install
cd ~/Desktop/aircrack-ng-1.2-beta1 && make && make install
cd ~/Desktop/wifite2 && python3 setup.py install
cd ~/Desktop/hcxdumptool && make && make install
cd ~/Desktop/hcxtools && make && make install
cd ~/Desktop/Pyrit-v0.5.0
python3 setup.py clean
python3 setup.py build
python3 setup.py install
cd ~/Desktop/Hcxpcaptool && make && make install
cd ~/Desktop/hashcat-utils/src && make

# Optional: build exact Wireshark version 3.0.0 from source
echo -e "${BYellow}Building Wireshark (optional)...${Color_Off}"
wget https://www.wireshark.org/download/src/wireshark-3.0.0.tar.xz -O /tmp/wireshark.tar.xz
tar -xf /tmp/wireshark.tar.xz -C /tmp/
cd /tmp/wireshark-3.0.0
cmake . && make && make install

# All done!
clear
figlet "All Done!"
echo -e "${BGreen}Wifite2Fix installation complete!${Color_Off}"
echo -e "${BCyan}To run wifite2, just type: ${BYellow}wifite${Color_Off}"
echo -e "${BCyan}Happy auditing!${Color_Off}"
exit 0
