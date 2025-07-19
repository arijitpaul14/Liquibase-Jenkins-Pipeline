FROM jenkins/jenkins:lts

USER root

# Install dependencies and Docker client
RUN apt-get update && apt-get install -y \
    git curl unzip \
    && curl -fsSL https://get.docker.com | sh \
    && rm -rf /var/lib/apt/lists/*

# Get host's Docker group ID and add jenkins to docker group
ARG DOCKER_GID
RUN groupadd -g ${DOCKER_GID} docker \
    && usermod -aG docker jenkins

USER jenkins