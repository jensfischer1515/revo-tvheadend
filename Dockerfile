FROM ubuntu:14.04
MAINTAINER Jens Fischer <soth@gmx.net>

# Skip install dialogues
ENV DEBIAN_FRONTEND noninteractive

# Install base tools
RUN apt-get install -y curl software-properties-common

# Import the tvheadend GPG signing key
RUN curl --insecure http://apt.tvheadend.org/repo.gpg.key | apt-key add -

# stable, beta or unstable
ENV TVHEADEND_REPO unstable

# Add tvheadend repo
RUN apt-add-repository http://apt.tvheadend.org/${TVHEADEND_REPO}

# Add non-free package repo
RUN apt-add-repository multiverse

# get up to date
RUN apt-get update && apt-get -y upgrade

# Install packages
RUN apt-get install -m -y \
    debconf \
    debconf-utils \
    usbutils \
    linux-firmware-nonfree 

#RUN echo "set tvheadend/admin_username admin" | debconf-communicate 
#RUN echo "set tvheadend/admin_password admin" | debconf-communicate 

# Install tvheadend
RUN apt-get install -m -y --force-yes tvheadend 

# clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9981 9982

VOLUME /config /recordings /data

CMD ["/usr/bin/tvheadend","-C","-u","hts","-g","hts","-c","/config"]
