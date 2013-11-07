# Deluge
#
FROM ubuntu
MAINTAINER Jason Kulatunga jason@thesparktree.com

########################################################################################################################
# ENV Variables

########################################################################################################################
# Install Deluge

# Adding sources
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Make sure we are up to date
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get -y install deluged deluge-web python-setuptools

########################################################################################################################
# Configure Deluge

# Expose our service
EXPOSE 8081

# Run docker with -v /mnt/synoVideos:/mnt/synoVideos to have
# our shows mounted in the container
# VOLUME ["/mnt/synoVideos"]

# Building in a supervisor for easy running
# RUN apt-get -y install python-setuptools
# RUN easy_install supervisor
# ADD .docker/supervisor.conf /opt/supervisor.conf
# ADD .docker/run.sh /opt/run

#CMD ["/bin/sh", "-e", "/opt/run"]


########################################################################################################################
# Start Deluge
CMD ["/usr/local/bin/supervisord", "-c", "/etc/supervisor.conf", "-n"]


## Building ##
# sudo docker -H=tcp://localhost build -t Deluge .

## Running ##
# sudo docker -H=tcp://localhost run -d -v /mnt/synoVideos:/mnt/synoVideos -p 80:8112

### TODO ###
# git clone a known config
# check for more needed ports (sharing anyone)