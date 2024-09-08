#!/bin/bash

# Update and upgrade system packages
echo "Updating package lists..."
sudo apt update && sudo apt upgrade -y

# Install Git
echo "Installing Git..."
sudo apt install git -y

# Install Nmap
echo "Installing Nmap..."
sudo apt install nmap -y

# Install Ncat (from nmap)
echo "Installing Ncat..."
sudo apt install ncat -y

# Install Apache server
echo "Installing Apache server..."
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

# Install Impacket
echo "Installing Impacket..."
sudo apt install python3-impacket -y

# Install Sliver (Latest release for Linux amd64)
echo "Installing Sliver..."
wget https://github.com/BishopFox/sliver/releases/latest/download/sliver-server_linux -O sliver-server
chmod +x sliver-server
sudo mv sliver-server /usr/local/bin/sliver-server

# Install Netexec (assuming it can be installed through apt)
echo "Installing Netexec..."
sudo apt install netexec -y

# Download Burp Suite Community Edition (latest)
echo "Installing Burp Suite..."
wget https://portswigger.net/burp/releases/download?product=community&version=2023.6.1&type=Linux -O burpsuite.sh
chmod +x burpsuite.sh
sudo ./burpsuite.sh

# Install PEzor (from GitHub)
echo "Installing PEzor..."
sudo apt install -y make gcc golang upx
git clone https://github.com/phra/PEzor.git
cd PEzor
make
sudo mv PEzor /usr/local/bin/PEzor
cd ..

# Install Windscribe CLI
echo "Installing Windscribe VPN..."

# First, add Windscribe repository key and repository
wget -q https://repo.windscribe.com/apt/windscribe-repo.gpg.key -O- | sudo tee /etc/apt/trusted.gpg.d/windscribe.asc
echo 'deb https://repo.windscribe.com/ubuntu bionic main' | sudo tee /etc/apt/sources.list.d/windscribe-repo.list

# Update package list and install Windscribe CLI
sudo apt update
sudo apt install windscribe-cli -y

# Login and connect to Windscribe (replace with your actual credentials)
windscribe login --username your_username --password your_password
windscribe connect

# Install ProxyChains
echo "Installing ProxyChains..."
sudo apt install proxychains4 -y

# Configuring ProxyChains to use Windscribe
echo "Adding Windscribe to ProxyChains configuration..."
sudo sed -i 's/^#socks4.*/socks5  127.0.0.1 1080/' /etc/proxychains.conf

echo "All tools installed, Windscribe VPN is connected, ProxyChains is configured, Git is installed, and Apache server is running!"