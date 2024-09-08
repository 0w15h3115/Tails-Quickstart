#!/bin/bash

# Stop Tor to bypass potential network restrictions
echo "Stopping Tor service..."
sudo systemctl stop tor

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

# Install PEzor
echo "Installing PEzor..."
# If network issues prevent cloning, ensure you've downloaded and transferred manually
if ! git clone https://github.com/phra/PEzor.git; then
  echo "Network issues encountered. Ensure you've downloaded PEzor manually."
  echo "Unzip and install from the local file if necessary."
  exit 1
fi
cd PEzor
make
sudo mv PEzor /usr/local/bin/PEzor
cd ..

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

# Restart Tor to restore privacy protections
echo "Restarting Tor service..."
sudo systemctl start tor

echo "All available tools installed! Apache server is running!"
