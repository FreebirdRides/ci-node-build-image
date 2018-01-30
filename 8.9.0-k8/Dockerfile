FROM circleci/node:8.9.0

# Install http apt transport (for yarn)
RUN sudo apt-get update \
  && sudo apt-get install -qqy apt-transport-https

# Add Mongo Repo
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# Add Yarn Repo
RUN sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Install APT deps
RUN sudo apt-get update \
  && sudo apt-get install -qqy gawk apt-utils mongodb-org-shell mongodb-org-tools python-dev python python-pip yarn \
  && sudo rm -rf /var/lib/apt/lists/*

# Install Convox CLI
RUN sudo curl -Ls https://install.convox.com/linux.zip > /tmp/convox.zip
RUN sudo unzip /tmp/convox.zip -d /usr/local/bin

# Install AWS CLI
RUN sudo pip install awscli

# Install Serverless
RUN sudo npm install -g serverless

# Install kops
RUN sudo curl -LO https://github.com/kubernetes/kops/releases/download/1.8.0/kops-linux-amd64
RUN sudo chmod +x kops-linux-amd64
RUN sudo mv kops-linux-amd64 /usr/local/bin/kops

# Install kubectl
RUN sudo curl -LO curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.9.2/bin/linux/amd64/kubectl
RUN sudo chmod +x ./kubectl
RUN sudo sudo mv ./kubectl /usr/local/bin/kubectl

# Install Yasha template parser
RUN sudo pip install yasha
