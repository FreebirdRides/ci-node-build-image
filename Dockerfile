FROM circleci/node:6.10.3

# install some apt packages
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN sudo apt-get update \
  && sudo apt-get install -qqy gawk apt-utils mongodb-org-shell mongodb-org-tools python-dev python python-pip \
  && sudo rm -rf /var/lib/apt/lists/*

# Install Convox CLI
RUN sudo curl -Ls https://install.convox.com/linux.zip > /tmp/convox.zip
RUN sudo unzip /tmp/convox.zip -d /usr/local/bin

# Install AWS CLI
RUN sudo pip install awscli

# Install Serverless
RUN sudo npm install -g serverless
