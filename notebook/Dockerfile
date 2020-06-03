FROM ubuntu:latest
WORKDIR /code
# base
RUN apt-get update && apt-get -y upgrade && apt-get install -y git build-essential apt-utils

# python
RUN apt-get update && apt-get install -y python3 python3-pip 
RUN pip3 install ipython jupyter jupyterthemes bash_kernel 
RUN python3 -m bash_kernel.install

# R
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y r-bioc-biocinstaller
RUN R -e "install.packages('IRkernel')"
RUN R -e "IRkernel::installspec(user = FALSE)"

# environment
RUN jt -t oceans16 -tf merriserif -tfs 10 -nf ptsans -nfs 13
CMD jupyter notebook --no-browser --allow-root --ip 0.0.0.0 --port 8888 /code

# docker container run -d -i -t -p 8686:8888 python
