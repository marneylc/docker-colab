FROM ubuntu:18.04

# apt dependencies
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y \
    apt-utils \
    libicu-dev \
    libstemmer-dev \
    libleveldb-dev \
    gcc-4.8 \
    g++-4.8 \
    build-essential \
    jq \
    curl
RUN apt-get install -y vim git

# gcc dependencies
RUN mkdir /usr/bin/gcc-8
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80
RUN mkdir /usr/bin/g++-8
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 80
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 90
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 90

# install and configure go
RUN cd /usr/local/ && curl -O https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
RUN cd /usr/local/ && tar xvf go1.14.4.linux-amd64.tar.gz
RUN cd /usr/local/ && rm go1.14.4.linux-amd64.tar.gz
ENV GOPATH=/usr/local/go
ENV PATH=$PATH:/usr/local/go/bin

# configure blevesearch
RUN mkdir -p ${GOPATH}/src/github.com/blevesearch
RUN cd ${GOPATH}/src/github.com/blevesearch && \
	git clone https://github.com/blevesearch/cld2.git
RUN cd ${GOPATH}/src/github.com/blevesearch/cld2 && \
	git clone https://github.com/CLD2Owners/cld2.git
RUN cd ${GOPATH}/src/github.com/blevesearch/cld2/cld2/internal && \
	./compile_libs.sh && \
	cp *.so /usr/local/lib

# build blast
RUN mkdir -p ${GOPATH}/src/github.com/mosuka
RUN cd ${GOPATH}/src/github.com/mosuka && git clone https://github.com/mosuka/blast.git
RUN cd ${GOPATH}/src/github.com/mosuka/blast && make

# working environment
RUN apt-get install -y tmux
RUN git clone https://github.com/marneylc/myvim.git
RUN cd myvim && ./init.sh
WORKDIR /home/
# other copy and run commands go here for specific build

# to build
# docker build -t blast-bleve .

# to deploy
# docker container run -d -t -v /home/dir-to-index/:/home/dir-to-index/ -p 7000:7000 -p 8000:8000 -p 9000:9000 blast-bleve
