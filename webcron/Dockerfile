############################################################
# Dockerfile to build WebCron Container Image
# based on Original crontab-ui Image
############################################################
# Container webcron
############################################################

# Set the base Image
FROM alseambusher/crontab-ui:latest

# File Author / Maintainer
MAINTAINER Sven Berger

COPY scripte/copy.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/copy.sh
