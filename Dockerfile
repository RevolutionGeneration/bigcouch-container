FROM centos:6

MAINTAINER Michal @ Revolution Generation <michal@revolutiongeneration.co.uk>

RUN useradd -r -g daemon -d /srv bigcouch && \
    mkdir -p /srv /var/log/bigcouch && \
    chown bigcouch:daemon /srv /var/log/bigcouch -R

RUN curl -o /etc/yum.repos.d/2600hz.repo http://repo.2600hz.com/2600hz.repo && \
    yum install -y epel-release && \
    yum clean all && \
    yum install -y kazoo-bigcouch-R15B && \
    yum install -y curl &&

VOLUME ["/srv"]

EXPOSE 5984 5986

CMD