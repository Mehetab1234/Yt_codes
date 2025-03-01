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
