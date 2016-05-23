# ubuntu-toolbox
#
# VERSION     0.0.1

FROM ubuntu:14.04
MAINTAINER John Ryan <jnyryan@gmail.com>

# enable the universe
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list

RUN apt-get update
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        make \
        rsync \
        software-properties-common \
        silversearcher-ag \
        vim \
        wget

# Install Python
RUN apt-get install -y python

# Install Ruby
RUN apt-get install -y ruby ruby-dev

# install NodeJS
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
ENV NODE_VERSION 5.0.0
ENV NVM_DIR /root/.nvm
RUN . ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

# delete all the apt list files since they're big and get stale quickly
#RUN rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
