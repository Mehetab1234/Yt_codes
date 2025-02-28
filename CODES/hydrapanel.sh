#!/bin/bash

# Exit immediately if any command fails
set -e

# Clear screen
clear

# Function to display colorful "CRAZE" message with blinking effect
function craze_message() {
    for i in {1..3}; do
        echo -e "\e[1;33m🚀 CRAZE TO CRAFTINGCRAZEGAMING! 🎮🔥\e[0m"
        echo -e "\e[1;34m📺 YouTube: https://youtube.com/@craftingcrazegaming\e[0m"
        sleep 0.5
        clear
        sleep 0.5
    done
}

# Show CRAZE message
craze_message

# Show final colorful CRAZE banner
echo -e "\e[1;31m ██████╗ ██████╗  █████╗ ████████╗███████╗\e[0m"
echo -e "\e[1;34m██╔════╝██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝\e[0m"
echo -e "\e[1;32m██║     ██║   ██║███████║   ██║   █████╗  \e[0m"
echo -e "\e[1;33m██║     ██║   ██║██╔══██║   ██║   ██╔══╝  \e[0m"
echo -e "\e[1;35m╚██████╗╚██████╔╝██║  ██║   ██║   ███████╗\e[0m"
echo -e "\e[1;36m ╚═════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝\e[0m"
echo -e "\e[1;33m ██████╗ ██████╗  █████╗ ████████╗███████╗\e[0m"
echo -e "\e[1;34m██╔════╝██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝\e[0m"
echo -e "\e[1;32m██║     ██║   ██║███████║   ██║   █████╗  \e[0m"
echo -e "\e[1;33m██║     ██║   ██║██╔══██║   ██║   ██╔══╝  \e[0m"
echo -e "\e[1;35m╚██████╗╚██████╔╝██║  ██║   ██║   ███████╗\e[0m"
echo -e "\e[1;36m ╚═════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝\e[0m"

# Countdown before installation
echo -e "\e[1;32m🚀 INSTALLATION STARTING IN...\e[0m"
for i in 5 4 3 2 1; do
    echo -e "\e[1;36m$i...\e[0m"
    sleep 1
done

echo -e "\e[1;32m🚀 INSTALLATION STARTING NOW! 🚀\e[0m"
sleep 1

# Ensure the script runs with root privileges
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[1;31m⚠️  Please run this script as root (using sudo)!\e[0m"
    exit 1
fi

# Update system and install required dependencies
echo -e "\e[1;34m🔄 Updating system and installing required dependencies...\e[0m"
apt update && apt install -y curl gnupg git

# Set up Node.js 20 repository
echo -e "\e[1;35m🔧 Setting up Node.js 20 repository...\e[0m"
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Add NodeSource repository
echo -e "\e[1;33m📦 Adding NodeSource repository...\e[0m"
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

# Update package lists again
echo -e "\e[1;34m🔄 Updating package lists...\e[0m"
apt update

# Install Node.js and Git
echo -e "\e[1;32m📥 Installing Node.js and Git...\e[0m"
apt install -y nodejs git

# Clone Oversee repository
echo -e "\e[1;35m🔽 Cloning Oversee repository...\e[0m"
if [ -d "Oversee" ]; then
    rm -rf Oversee
fi
git clone https://github.com/ma4z-sys/Oversee.git
cd Oversee

# Install dependencies
echo -e "\e[1;36m⚙️ Installing dependencies...\e[0m"
npm install

# Seed database
echo -e "\e[1;33m🌱 Seeding database...\e[0m"
npm run seed

# Create user
echo -e "\e[1;32m👤 Creating user...\e[0m"
npm run createUser

# Start Oversee
echo -e "\e[1;31m🚀 Starting Oversee...\e[0m"
node .
