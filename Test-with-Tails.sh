#!/bin/bash

# Update and upgrade system packages
echo "Updating package lists... This may take a while... "
sudo apt update && sudo apt upgrade -y
# Working


# install and use Zsh
sudo apt install zsh -y
zsh

# Install Pip
sudo apt install python3-pip pipx -y
# Working

# Install Nmap (includes Ncat)
echo "Installing Nmap..."
sudo apt install nmap -y
# Working

# Install Apache server
echo "Installing Apache server..."
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
# Working

# Install Impacket via pip
echo "Installing Impacket..."
sudo apt install python3-impacket
# Working

# Install Build-Essential for compiling software
echo "Installing build-essential..."
sudo apt install build-essential -y

# Install Sliver C2
echo "Installing Sliver..."
torify wget https://github.com/BishopFox/sliver/releases/latest/download/sliver-server_linux -O sliver-server
chmod +x sliver-server
sudo mv sliver-server /usr/local/bin/sliver-server


# Download and Install Burp Suite Community Edition
echo "Installing Burp Suite..."
torify wget "https://portswigger.net/burp/releases/download?product=community&version=2023.6.1&type=Linux" -O burpsuite.sh
sudo chmod +x burpsuite.sh
sudo ./burpsuite.sh


# Install Netexec
sudo apt install pipx git
pipx ensurepath
torify pipx install git+https://github.com/Pennyw0rth/NetExec

echo "Tails ready to Test!"
