FROM jenkins/jenkins:lts

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    git curl unzip netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Install Docker client only (no daemon)
ARG DOCKER_VERSION=20.10.9
RUN curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | \
    tar -xzC /usr/local/bin --strip-components=1 docker/docker

# Create docker group with host's GID
ARG DOCKER_GID
RUN groupadd -g ${DOCKER_GID} docker \
    && usermod -aG docker jenkins

USER jenkins