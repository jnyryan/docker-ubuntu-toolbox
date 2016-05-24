# ubuntu-toolbox
#
# VERSION     0.0.1

FROM ubuntu:14.04
MAINTAINER John Ryan <jnyryan@gmail.com>

# enable the universe
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list

# Add sources for dotNet Core
RUN echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/dotnet/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list
RUN apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893

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

# Install NodeJS
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
ENV NODE_VERSION 5.0.0
ENV NVM_DIR /root/.nvm
RUN . ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

# Install dotNet
RUN apt-get install -y dotnet-dev-1.0.0-preview1-002702

# delete all the apt list files since they're big and get stale quickly
#RUN rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
