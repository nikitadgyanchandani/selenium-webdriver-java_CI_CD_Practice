FROM jenkins/jenkins:lts

USER root

# Install Git, Maven and other dependencies
RUN apt-get update && \
    apt-get install -y git maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER jenkins
