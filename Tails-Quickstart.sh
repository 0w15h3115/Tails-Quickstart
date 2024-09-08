#!/bin/bash

# Update and upgrade system packages
echo "Updating package lists..."
sudo apt update && sudo apt upgrade -y

# Install Git
echo "Installing Git..."
sudo apt install git -y

# Install Nmap (includes Ncat)
echo "Installing Nmap..."
sudo apt install nmap -y

# Install Apache server
echo "Installing Apache server..."
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

# Install Impacket via pip
echo "Installing Impacket..."
sudo apt install python3-pip -y
pip3 install impacket

# Install Build-Essential for compiling software
echo "Installing build-essential..."
sudo apt install build-essential -y

# Install Sliver
echo "Installing Sliver..."
wget https://github.com/BishopFox/sliver/releases/latest/download/sliver-server_linux -O sliver-server
chmod +x sliver-server
sudo mv sliver-server /usr/local/bin/sliver-server

# Download and Install Burp Suite Community Edition
echo "Installing Burp Suite..."
wget "https://portswigger.net/burp/releases/download?product=community&version=2023.6.1&type=Linux" -O burpsuite.sh
chmod +x burpsuite.sh
sudo ./burpsuite.sh

# Install UPX from local file (assuming you manually transferred it)
echo "Installing UPX from local file..."
# Adjust the path if necessary
tar -xf /media/usb/upx-3.96-amd64_linux.tar.xz
sudo mv upx-3.96-amd64_linux/upx /usr/local/bin/

# Install Netexec
echo "Installing Netexec..."
git clone https://github.com/mgrosse/netexec.git
cd netexec
make
sudo mv netexec /usr/local/bin/netexec
cd ..

# Install ProxyChains
echo "Installing ProxyChains..."
sudo apt install proxychains4 -y

echo "All available tools installed! Apache server is running!"
