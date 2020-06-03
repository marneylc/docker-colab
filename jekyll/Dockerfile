FROM ubuntu:latest
MAINTAINER Luke Marney marneylc@gmail.com

# base
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y git && apt-get install -y software-properties-common
RUN apt-get install -y python-pip python-dev ruby-full build-essential
RUN pip install --upgrade pip
RUN apt-get install -y vim
RUN pip install awscli

# build ruby configuration
RUN mkdir gems \
	&& echo '# Install Ruby Gems to /gems' >> /gems/.bashrc \
	&& echo 'export GEM_HOME=/gems' >> /gems/.bashrc \
	&& echo 'export PATH=/gems/bin:$PATH' >> /gems/.bashrc \
	&& /bin/bash -c "source /gems/.bashrc"

# install jekyll
RUN gem install jekyll bundler
RUN gem install jekyll-paginate
RUN gem install jekyll-theme-so-simple
RUN gem install minima

WORKDIR /breathe
CMD ["jekyll", "s", "--host", "0.0.0.0"]
