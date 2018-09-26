#!/bin/sh
# Scripte zum Kopieren neuer Scripte

# Sichern des Kopierscriptes auf externes Volume
cp /usr/local/bin/copy.sh /etc/scripte

# Kopieren der Scripte auf dem Externen Volume in den Container
cp /etc/scripte/*.sh /usr/local/bin/

# Ausführbar machen der neuen Scripte
chmod +x /usr/local/bin/*.sh
