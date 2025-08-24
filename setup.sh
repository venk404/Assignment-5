#!/bin/bash

# Function to update system packages
update_system() {
    echo "Updating system packages..."
    apt-get update
    apt-get upgrade -y
}

# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io
    
    # Start Docker service
    systemctl start docker
    systemctl enable docker
    
    # Add vagrant user to docker group
    usermod -aG docker $USER
}

# Function to install Docker Compose
install_docker_compose() {
    echo "Installing Docker Compose..."
    curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
}


# Function to install Make
install_make() {
    echo "Installing Make..."
    apt-get install -y make
}

deploy_app() {
    echo "Running the application using Docker Compose..."
    cd /vagrant
    make all
}

# Main execution
main() {
    update_system
    install_docker
    install_docker_compose
    install_make
    deploy_app
    echo "Setup completed successfully!"
}

# Run main function
main