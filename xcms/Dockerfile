FROM rocker/rstudio:latest

LABEL maintaner="Luke Marney <marneyl@seattlu.edu>"

# add some ubuntu repositories
RUN apt-get update && apt-get -y install software-properties-common

# package dependencies for R libraries
RUN apt-get -y install libnetcdf-dev libxml2-dev

# environment for rstudio
ENV USER rstudio
WORKDIR /home/rstudio/
COPY init.R /home/rstudio/

RUN Rscript init.R

# to run 
# docker build -t rstudio .
# docker container run -d -e ROOT=TRUE -e PASSWORD=password -v /Users/marneyl/Downloads/:/home/work/Downloads/ -p 8787:8787 rstudio
# be sure to open up port 8787

