#!/usr/bin/env bash
set -euxo pipefail

# Install Docker on Ubuntu/Debian as a Linux Bash script.
# This script follows the standard Docker engine installation workflow.

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker "$USER"

cat <<'EOF'
Docker installation complete.

Docker fundamentals:
- Volumes: persistent storage for data; define them with `volumes:` in Docker Compose.
- Networking: containers communicate through user-defined or default bridge networks.
- Example: `docker network ls` and `docker volume ls` help inspect the environment.

Please log out and log back in to refresh group membership.
EOF
