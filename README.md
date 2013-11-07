#Docker-Deluge

##Introduction
The docker-deluge repo is contains the deluge configuration for the Depot container.
Based off of `https://github.com/user419/docker-deluge`

The Dockerfile does the following:

- Installs python-cheetah
- Downloads the newest version of the "Sickbeard TPB Branch" from `https://github.com/mr-orange/Sick-Beard`
- Extracts Sickbeard TPB into `/var/sickbeard`
- TODO: configure the webui port and url
- TODO: configure the utorrent port and url
- TODO: configure the extract process
- TODO: setup daemon to run on system startup.

##Important Notes
N/A

##Configuration
N/A

##Setup
N/A

##Usage & Common Tasks

- remove all docker images `docker rmi $(docker images | grep -v 'ubuntu\|my-image' | awk {'print $3'})`
- run interactive shell on a docker image `docker run -i -t sickbeard /bin/bash`
- tag a image `docker tag 85bd818c5744 sickbeard`


##Testing
N/A

##Deploy Instructions
N/A

##Troubleshooting
N/A

##ToDo list
N/A

##Contributing Changes.
1. Branch off of the development branch
2. Commit your changes
3. Create a pull request against the development branch

##License

##References
1. https://wiki.archlinux.org/index.php/deluge