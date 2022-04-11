#!/bin/bash

# Allow HTTP
iptables -t mangle -A OUTPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t mangle -A OUTPUT -p tcp --sport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t mangle -A INPUT -p tcp --dport 80 -m state --state ESTABLISHED -j ACCEPT
iptables -t mangle -A INPUT -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

# Allow HTTPS
iptables -t mangle -A OUTPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t mangle -A OUTPUT -p tcp --sport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t mangle -A INPUT -p tcp --dport 443 -m state --state ESTABLISHED -j ACCEPT
iptables -t mangle -A INPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT
