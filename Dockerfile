# Jenkins.
FROM ubuntu:14.04

MAINTAINER Michal @ Revolution Generation <michal@revolutiongeneration.co.uk>

# Enable the Ubuntu multiverse repository.
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse">> /etc/apt/source.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list

# Update
RUN apt-get update && apt-get install -y zip unzip wget curl autoconf automake bison build-essential fail2ban gawk git-core wget zip unzip make libncurses5-dev libssl-dev gcc g++ openjdk-6-jdk unixodbc-dev xsltproc vim-nox libexpat1-dev libxml2-dev libicu-dev libcurl4-openssl-dev

# Install lubmozjs
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 74EE6429
RUN bash -c 'echo "deb http://ppa.launchpad.net/commonjs/ppa/ubuntu karmic main" >> /etc/apt/sources.list.d/commonjs.list'
RUN apt-get update
RUN apt-get install libmozjs-1.9.2 libmozjs-1.9.2-dev
RUN ln -s /usr/lib/libmozjs-1.9.2.so /usr/lib/libmozjs.so

# Install erlang
RUN wget http://erlang.org/download/otp_src_R15B03-1.tar.gz -P /usr/src/
RUN tar -C /opt/ -zxf /usr/src/otp_src_R15B03-1.tar.gz
WORKDIR /opt/otp_src_R15B03/
RUN ./configure && make && make install
RUN ln -s /usr/local/lib/erlang/ /usr/lib/erlang


# Install Bigcouch
RUN git clone https://github.com/cloudant/bigcouch.git /usr/src/bigcouch
WORKDIR /usr/src/bigcouch/
RUN ./configure
RUN make && make install

# Conf
ADD build/bigcouch /opt/bigcouch/bin/bigcouch
RUN chmod +x /opt/bigcouch/bin/bigcouch
ENV PATH=$PATH:/opt/bigcouch/bin/

RUN mkdir /etc/bigcouch
ADD conf/local.ini /etc/bigcouch/local.ini
ADD conf/vm.args /etc/bigcouch/vm.args

# Start
COPY start.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/start.sh

EXPOSE 5984
EXPOSE 5986

CMD ["/usr/local/bin/start.sh"]