#!/bin/bash

# Update and upgrade system packages
echo "Updating package lists..."
sudo apt update && sudo apt upgrade -y

# Install Git (available in Tails)
echo "Installing Git..."
sudo apt install git -y

# Install Nmap (available in Tails)
echo "Installing Nmap..."
sudo apt install nmap -y

# Install Ncat (from nmap, available in Tails)
echo "Installing Ncat..."
sudo apt install ncat -y

# Install Apache server (available in Tails)
echo "Installing Apache server..."
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

# Install Impacket via pip (available in Tails)
echo "Installing Impacket..."
sudo apt install python3-pip -y
pip3 install impacket

# Install ProxyChains (available in Tails)
echo "Installing ProxyChains..."
sudo apt install proxychains4 -y

# Install Sliver (Manual installation because it's not available in Tails' repository)
echo "Installing Sliver..."
wget https://github.com/BishopFox/sliver/releases/latest/download/sliver-server_linux -O sliver-server
chmod +x sliver-server
sudo mv sliver-server /usr/local/bin/sliver-server

# Download Burp Suite Community Edition (Manual installation)
echo "Installing Burp Suite..."
wget https://portswigger.net/burp/releases/download?product=community&version=2023.6.1&type=Linux -O burpsuite.sh
chmod +x burpsuite.sh
sudo ./burpsuite.sh

# Install PEzor (Manual installation, assuming dependencies are available in Tails)
echo "Installing PEzor..."
sudo apt install -y make gcc golang upx
git clone https://github.com/phra/PEzor.git
cd PEzor
make
sudo mv PEzor /usr/local/bin/PEzor
cd ..

# Install Netexec (Manual installation since it might not be in default repositories)
echo "Installing Netexec..."
git clone https://github.com/mgrosse/netexec.git
cd netexec
make
sudo mv netexec /usr/local/bin/netexec
cd ..

echo "All available tools installed! Apache server is running!"