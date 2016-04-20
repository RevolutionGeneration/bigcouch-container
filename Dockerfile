# Jenkins.
FROM debian:jessie

MAINTAINER Michal @ Revolution Generation <michal@revolutiongeneration.co.uk>

# Update
RUN apt-get update && apt-get install -y zip unzip wget curl git

# Install Bigcouch
EXPOSE 5984
EXPOSE 5986

CMD ["/usr/local/bin/start.sh"]