############################################################
# Dockerfile zum erstellen eines Dockercontainers für
# unbound
############################################################

############################################################
# Argument Variables from YAML File
############################################################

FROM amd64/debian:stable

# File Author / Maintainer
MAINTAINER Sven Berger

############################################################
############################################################
# USE CROSS-BUILD for Raspberry PI Images
############################################################
############################################################

#COPY bin/ /usr/bin/
#RUN [ "cross-build-start" ]

############################################################
# don't ask for stupid things
############################################################

ENV DEBIAN_FRONTEND noninteractive
RUN echo APT::Install-Recommends "0"; >> /etc/apt/apt.conf
RUN echo APT::Install-Suggests "0"; >> /etc/apt/apt.conf

############################################################
# Environment Variables
############################################################

############################################################
# User Ändern
############################################################

############################################################
# Upgrade Software: Installed
############################################################

RUN apt update \
    && apt -y full-upgrade

############################################################
# Install Software: Unbound
############################################################

RUN apt -y install \
    unbound \
    unbound-anchor \
    unbound-host \
    dnscrypt-proxy \
    curl

############################################################
# Remove Apt Data
############################################################

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

############################################################
# Copy External Data
############################################################

COPY config/unbound.conf /etc/unbound/unbound.conf
RUN curl ftp://ftp.internic.net/domain/named.cache > /etc/unbound/root.hints

#RUN unbound-checkconf

############################################################
# Copy Start Scripts
############################################################

COPY scripte/run.sh /run.sh
COPY scripte/entrypoint.sh /entrypoint.sh
RUN chmod +x /run.sh
RUN chmod +x /entrypoint.sh
RUN find / -name root.key
RUN cp /usr/share/dns/root.key /var/lib/unbound/
RUN chown unbound:unbound -R /var/lib/unbound
RUN chmod +w -R /var/lib/unbound
RUN /usr/sbin/unbound-anchor -v4 \
    -a /var/lib/unbound/root.key \
    -r /etc/unbound/root.hints

############################################################
# Folders needed
############################################################

VOLUME ["/etc/unbound/conf.d", "/etc/unbound/local.d"]
# , "/etc/unbound/dnsovertls"]

############################################################
# Ports needed
############################################################

EXPOSE 53/udp

############################################################
############################################################
# USE CROSS-BUILD for Raspberry PI Images
############################################################
############################################################

#RUN [ "cross-build-end" ]

############################################################
# Container Start
############################################################

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/run.sh" ]