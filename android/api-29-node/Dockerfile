FROM circleci/android:api-29-node

# Install Ruby
RUN ruby-install --cleanup ruby 2.7.2

ENV PATH ${HOME}/.rubies/ruby-2.7.2/bin:${PATH}
RUN echo 'gem: --env-shebang --no-rdoc --no-ri' >> ~/.gemrc && gem install bundler

# Install AWS CLI
RUN sudo pip install awscli