# Use Jenkins LTS image as base
FROM jenkins/jenkins:lts

# Switch to root user for installing dependencies
USER root

# Install Docker CLI and required packages
RUN apt-get update && \
   apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      gnupg \
      lsb-release && \
   mkdir -p /etc/apt/keyrings && \
   curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
   chmod a+r /etc/apt/keyrings/docker.gpg && \
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
      > /etc/apt/sources.list.d/docker.list && \
   apt-get update && \
   apt-get install -y --no-install-recommends docker-ce-cli && \
   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch back to the default Jenkins user
USER jenkins
