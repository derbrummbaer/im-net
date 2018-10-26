#!/bin/sh
set -e

# This won't work if --dns=127.0.0.1 (bootstrapping problems)
# /etc/periodic/monthly/update-unbound-root-hints

# From CentOS but not sure how to do on alpine..
/usr/sbin/unbound-anchor -v 4 \
    -a /var/lib/unbound/root.key \
    -r /etc/unbound/root.hint

/usr/sbin/unbound-checkconf

/usr/sbin/unbound-control-setup -d /etc/unbound/

exec "$@"