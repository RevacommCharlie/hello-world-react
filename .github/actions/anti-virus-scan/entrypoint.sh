#!/bin/sh -l
clamscan --version
mkdir -p /store && chown clamav /store
freshclam --config-file /etc/clamav/freshclam.conf --datadir=/store
clamscan --recursive --infected --detect-pua=yes --max-scansize=300M --max-filesize=100M --max-recursion=30 --max-files=50000 --tempdir=/tmp --database=/store .
