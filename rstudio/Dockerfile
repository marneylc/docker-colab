FROM rocker/rstudio:latest

LABEL maintaner="Luke Marney <marneylc@gmail.com>"

# add some ubuntu repositories
RUN apt-get update && apt-get -y install software-properties-common htop git

# r package dependencies
RUN apt-get -y install libnetcdf-dev

# environment for rstudio
ENV USER rstudio
WORKDIR /home/rstudio/
COPY init.R /home/rstudio/init.R

RUN Rscript init.R
# to run 
# docker build -t rstudio .
# docker container run -d -e ROOT=TRUE -e PASSWORD=password --memory="16g" --cpu-shares=256 -v /home/user/rcode/:/home/work/rcode -p 8787:8787 rstudio
# be sure to open up port 8787

