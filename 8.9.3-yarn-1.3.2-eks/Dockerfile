FROM circleci/node:8.9.3

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
  && sudo apt-get install -qqy gawk apt-utils mongodb-org-shell mongodb-org-tools python-dev python python-pip yarn=1.3.2-1 \
  && sudo rm -rf /var/lib/apt/lists/*

# Install Convox CLI
# RUN sudo curl -Ls https://install.convox.com/linux.zip > /tmp/convox.zip
# RUN sudo unzip /tmp/convox.zip -d /usr/local/bin

# Install PIP packages
RUN sudo pip install PySocks awscli yasha

# Install Serverless
RUN sudo npm install -g serverless

# Install kubectl
RUN sudo curl -LO curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.10.3/bin/linux/amd64/kubectl
RUN sudo chmod +x ./kubectl
RUN sudo sudo mv ./kubectl /usr/local/bin/kubectl

# Install aws-iam-authenticator
RUN sudo curl -o aws-iam-authenticator \
  https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator
RUN sudo chmod +x ./aws-iam-authenticator
RUN sudo sudo mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
