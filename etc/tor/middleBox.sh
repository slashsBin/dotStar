#!/usr/bin/env sh
# Kernel IP forwarding MUST be disabled
# @/etc/resolv.conf: nameserver 127.0.0.1

# Tor's TransPort
_trans_port="9040"

# Your internal interface
_int_if="eth0"

iptables -F
iptables -t nat -F

iptables -t nat -A PREROUTING -i $_int_if -p udp --dport 53 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -i $_int_if -p tcp --syn -j REDIRECT --to-ports $_trans_port
