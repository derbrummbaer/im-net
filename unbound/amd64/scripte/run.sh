#!/bin/bash

curl ftp://ftp.internic.net/domain/named.cache > /etc/unbound/root.hints

# Start unbound
exec unbound
