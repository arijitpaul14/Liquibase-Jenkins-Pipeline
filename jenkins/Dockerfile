FROM jenkins/jenkins:lts

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    git curl unzip netcat \
    && curl -fsSL https://get.docker.com | sh \
    && rm -rf /var/lib/apt/lists/*

# Dynamically add host's Docker group
ARG DOCKER_GID
RUN groupadd -g ${DOCKER_GID} docker \
    && usermod -aG docker jenkins

USER jenkins