#!/bin/bash

# url ftp://ftp.internic.net/domain/named.cache > /etc/unbound/root.hints

# Start unbound
exec unbound -c /etc/unbound/unbound.conf -d -v
