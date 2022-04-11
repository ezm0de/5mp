#!/bin/bash

sudo iptables -t raw -F
sudo iptables -t raw -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t filter -F
sudo iptables -t filter -X
sudo iptables -F
sudo iptables -X

sudo bash iptables-ssh.sh
sudo bash iptables-http.sh
sudo bash iptables-deny.sh
