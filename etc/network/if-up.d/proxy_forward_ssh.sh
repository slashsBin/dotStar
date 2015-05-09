#!/bin/sh
# Forward Proxy via OpenSSH
# This is Useful for Local Cross-Network Port Forwarding

# Local User of OpenSSH
USER=mohammad
# Local Source Port for Forwarding from
SPORT=3389
# Destination Network
DNET=172.16.10.20
# Destination Port for Forwarding to
DPORT=3389

/usr/bin/ssh -i /home/$USER/.ssh/id_rsa -NTfnqygL $SPORT:$DNET:$DPORT $USER@localhost >>/var/log/proxy_forward_ssh__$SPORT_to_$DPORT.log 2>&1

exit 0
