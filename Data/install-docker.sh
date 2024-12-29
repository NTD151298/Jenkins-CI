#!/bin/bash

# Update the list of available packages
sudo apt-get update

# Install necessary packages: ca-certificates, curl, gnupg, and lsb-release
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Download the Docker GPG key and save it to the system
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository to the list of package sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker and Docker Compose
sudo apt-get install docker.io docker-compose -y

# Enable Docker to start automatically on system boot
systemctl enable docker.service

# Start Docker service
systemctl start docker.service

# Configure Docker daemon (cgroup driver, log driver, storage driver)
cat <<EOF | sudo tee /etc/docker/daemon.json
{
   "exec-opts": ["native.cgroupdriver=systemd"],
   "log-driver": "json-file",
   "log-opts": {
      "max-size": "100m"
   },
   "storage-driver": "overlay2"
}
EOF

# Enable Docker service to start automatically
sudo systemctl enable docker

# Reload systemd configurations
sudo systemctl daemon-reload

# Restart Docker to apply new configurations
sudo systemctl restart docker

# Grant permission for all users to access Docker socket 
sudo chmod 777 /var/run/docker.sock

