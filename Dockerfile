# Deluge
#
FROM ubuntu
MAINTAINER Jason Kulatunga jason@thesparktree.com

########################################################################################################################
# ENV Variables
ENV DOCKER_HOME /var/docker
ENV DELUGE_CONFIG_HOME //.config/deluge

ENV DELUGE_COMPLETED_PATH /tmp/complete
ENV DELUGE_PROCESSING_PATH /tmp/processing
ENV DELUGE_BLACKHOLE_PATH /tmp/blackhole
ENV DELUGE_DAEMON_PORT 58846
ENV DELUGE_DAEMON_USER deluge
ENV DELUGE_DAEMON_PASSWORD admin
ENV DELUGE_WEBUI_PORT 54323
########################################################################################################################
# Install Deluge

# Adding sources
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Make sure we are up to date
RUN apt-get update
RUN apt-get upgrade -y

# Install Python-Cheetah, a prereq for templating
RUN apt-get -y install python-cheetah

RUN apt-get -y install deluged deluge-web

#copy over the config file.
# ADD core.conf $DELUGE_CONFIG_HOME/core.conf
#copy over the webconfig file.
# ADD web.conf $DELUGE_CONFIG_HOME/web.conf
#copy over the config file.
# ADD web_plugin.conf $DELUGE_CONFIG_HOME/web_plugin.conf

RUN cheetah f template/core --env --oext conf --odir $DELUGE_CONFIG_HOME
RUN cheetah f template/web --env --oext conf --odir $DELUGE_CONFIG_HOME
RUN cheetah f template/web_plugin --env --oext conf --odir $DELUGE_CONFIG_HOME
RUN cheetah f template/auth --env --oext conf --odir $DELUGE_CONFIG_HOME


########################################################################################################################
# Configure Deluge

# Expose our service
EXPOSE 54323

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
# Start Deluge Daemon
CMD ["deluged", "&& deluge-web" ]


## Building ##
# sudo docker -H=tcp://localhost build -t Deluge .

## Running ##
# sudo docker -H=tcp://localhost run -d -v /mnt/synoVideos:/mnt/synoVideos -p 80:8112

### TODO ###
# git clone a known config
# check for more needed ports (sharing anyone)