FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
  git curl unzip docker.io \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 999 docker || true && usermod -aG docker jenkins  

USER jenkins