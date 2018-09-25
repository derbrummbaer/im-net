#!/bin/sh

apt-get update -qq
apt-get install -qy locales
echo "Europe/Berlin" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen; locale-gen

export LANG="de_DE.UTF-8"
export LANGUAGE="de_DE:de"
export LC_ALL="de_DE.UTF-8"

apt-get install -qy build-essential \
	mariadb-common libmariadbclient-dev libmariadbclient18 zlib1g zlib1g-dev \
	libcrypto++-dev libssl-dev

cd /tmp/epglv && make all && make install

apt-get remove -qy build-essential libcrypto++-dev libssl-dev libmariadbclient-dev zlib1g-dev -y

apt-get autoremove -qy && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
