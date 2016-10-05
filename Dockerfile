FROM ubuntu:latest

# Install Java 8.
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get install -y \
  oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install all other tools 
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    dos2unix \
    gcc \
    git \
    libldap2-dev \
    libpq-dev \
    libmysqlclient-dev \
    libsasl2-dev \
    libssl-dev \
    make \
    maven \
    nodejs \
    npm \
    python-pip \
    python2.7 \
    python2.7-dev \
    python-dev \
    python-ldap \
    python-svn \
    ruby \
    ruby-dev \
    ssh \
    subversion \
    vim \
    virtualenv \
    zip \
    && apt-get autoremove \
    && apt-get clean  

# just some config and additional frontend stuff...?
RUN echo "set term=ansi" >> ~/.vimrc && \
    mkdir ~/.gradle && echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    npm install npm -g && \
    npm install -g bower && \
    npm install -g grunt-cli && \
    gem install saas && \
    gem install compass

#
#    TODO: all the python requirements below:
#    firewallforcode/mdm -> pip install -r requirements.txt
#    firewallforcode/deployment/v2 -> pip install -r requirements.txt
#    firewallforcode/ui-backend -> pip install -r requirements.txt





# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

