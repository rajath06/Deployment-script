#!/bin/bash

# Update system packages
sudo apt update -y

# Install dependencies
sudo apt install -y wget tar default-jdk

# Define Maven version
MAVEN_VERSION=3.9.6

# Download Maven
cd /opt
sudo wget https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz

# Extract Maven
sudo tar -xvzf apache-maven-${MAVEN_VERSION}-bin.tar.gz
sudo ln -s apache-maven-${MAVEN_VERSION} maven

# Set environment variables
cat <<EOF | sudo tee /etc/profile.d/maven.sh
export MAVEN_HOME=/opt/maven
export PATH=\$MAVEN_HOME/bin:\$PATH
EOF

# Apply the environment variables
source /etc/profile.d/maven.sh

# Verify Maven installation
mvn -version
