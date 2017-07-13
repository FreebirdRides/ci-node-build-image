FROM circleci/node:6.10.3

# install some apt packages
RUN sudo apt-get update \
  && sudo apt-get install -qqy python-dev python python-pip \
  && sudo rm -rf /var/lib/apt/lists/*

# Install Convox CLI
RUN sudo curl -Ls https://install.convox.com/linux.zip > /tmp/convox.zip
RUN sudo unzip /tmp/convox.zip -d /usr/local/bin

# Install AWS CLI
RUN sudo pip install awscli
