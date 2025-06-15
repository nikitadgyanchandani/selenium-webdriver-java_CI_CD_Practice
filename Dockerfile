FROM jenkins/jenkins:lts

USER root

# Install Java, Git, Maven and other dependencies
RUN apt-get update && \
    apt-get install -y default-jdk git maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH=$JAVA_HOME/bin:$PATH

USER jenkins
