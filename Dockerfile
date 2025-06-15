FROM jenkins/jenkins:lts

USER root

# Install Git and other dependencies
RUN apt-get update && \
    apt-get install -y git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Maven
RUN curl -O https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz && \
    tar xzvf apache-maven-3.9.6-bin.tar.gz -C /opt && \
    rm apache-maven-3.9.6-bin.tar.gz && \
    ln -s /opt/apache-maven-3.9.6 /opt/maven

# Set environment variables for Maven
ENV M2_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}

USER jenkins
