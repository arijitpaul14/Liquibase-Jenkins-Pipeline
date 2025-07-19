FROM openjdk:11

RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

WORKDIR /liquibase

RUN mkdir -p /opt/liquibase && \
    wget -q https://github.com/liquibase/liquibase/releases/download/v4.24.0/liquibase-4.24.0.tar.gz && \
    tar -xzf liquibase-4.24.0.tar.gz -C /opt/liquibase && \
    rm liquibase-4.24.0.tar.gz

ENV PATH="/opt/liquibase:${PATH}"

CMD ["liquibase", "--version"]