#!/bin/bash

# Deny all other traffic
iptables -t mangle -A INPUT -j DROP
iptables -t mangle -A OUTPUT -j DROP
