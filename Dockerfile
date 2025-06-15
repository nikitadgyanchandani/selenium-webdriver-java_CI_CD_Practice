FROM jenkins/jenkins:lts

USER root

# Install build tools and dependencies
RUN apt-get update && \
    apt-get install -y \
    default-jdk \
    git \
    maven \
    wget \
    gnupg2 \
    unzip \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up Java environment
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH=$JAVA_HOME/bin:$PATH

# Install Chrome browser
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set display for Chrome
ENV DISPLAY=:99

# Switch back to jenkins user
USER jenkins
