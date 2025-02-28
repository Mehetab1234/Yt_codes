#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install Node.js and Git
echo "Installing Node.js and Git..."
sudo apt install -y nodejs git

# Clone the repository
echo "Cloning the repository..."
git clone https://github.com/HydraLabs-beta/daemon.git

# Navigate to the project directory
cd daemon || { echo "Failed to enter the daemon directory!"; exit 1; }

# Install project dependencies
echo "Installing dependencies..."
npm install

# Show message and wait for user input
echo "---------------------------------------------"
echo "enter your node config"
echo "After running your node config enter node ."
echo "---------------------------------------------"
echo "installation complete"
