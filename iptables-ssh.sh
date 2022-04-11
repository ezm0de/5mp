#!/bin/bash

# Allow outgoing ssh
iptables -t mangle -A OUTPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t mangle -A OUTPUT -p tcp --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t mangle -A INPUT -p tcp --dport 22 -m state --state ESTABLISHED -j ACCEPT
iptables -t mangle -A INPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
