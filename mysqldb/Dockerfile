############################################################
# Dockerfile to build SQL Container Image
# based on Original mysqldb Image
############################################################
# Container sql
############################################################

# Set the base Image
FROM mysql:5.7

# File Author / Maintainer
MAINTAINER Sven Berger

RUN apt-get update -qq && \
    apt-get install -qy locales && \
    echo "Europe/Berlin" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen; locale-gen

RUN apt-get install -qy build-essential \
	mysql-common \
    libmysqlclient-dev \
    libmysqlclient20 \
	zlib1g \
	zlib1g-dev \
	libcrypto++-dev \
	libssl-dev

WORKDIR /tmp

RUN mkdir -p /tmp/epglv/src
COPY epglv/* /tmp/epglv/
COPY epglv/src/* /tmp/epglv/src/

RUN cd /tmp/epglv && \
	make all && \
	make install

RUN apt-get remove -qy \
	build-essential \
	libcrypto++-dev \
	libssl-dev \
    libmysqlclient-dev \
	zlib1g-dev -y

RUN apt-get autoremove -qy && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8

COPY scripte/mysqlepgd.cnf /etc/mysql/conf.d/
COPY scripte/*.sql /docker-entrypoint-initdb.d/

############################################################
# don't ask for stupid things
############################################################

############################################################
# Environment Variables
############################################################

############################################################
# Update Repository and upgrade Software
############################################################

############################################################
# Konfigure timezone and locale
############################################################

############################################################
# User anlegen
############################################################

############################################################
# HomeVerzeichnis mit Sticky Bit versehen
############################################################

############################################################
# Update Apt and Upgrade Software
############################################################

############################################################
# Remove Apt Data
############################################################

############################################################
# Install gosu
############################################################

############################################################
############################################################
# USE CROSS-BUILD for Raspberry PI Images
############################################################
############################################################

############################################################
# Container Start
############################################################
