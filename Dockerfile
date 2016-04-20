# Jenkins.
FROM ubuntu:14.04
MAINTAINER Michal @ Revolution Generation <michal@revolutiongeneration.co.uk>

# Enable the Ubuntu multiverse repository.
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse">> /etc/apt/source.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list

# Update
RUN apt-get update && apt-get install -y zip unzip wget curl

# Install Bigcouch
RUN echo "deb http://packages.cloudant.com/ubuntu `lsb_release -cs` main" | tee /etc/apt/sources.list.d/cloudant.list
RUN apt-get update
RUN apt-get install bigcouch

EXPOSE 5984
EXPOSE 5986

CMD ["/usr/local/bin/start.sh"]