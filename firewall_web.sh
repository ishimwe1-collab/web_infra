#!/usr/bin/env bash


iptables -F
iptables -X

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -i lo -j ACCEPT


iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT


iptables -A INPUT -p tcp --dport 22 -j ACCEPT


iptables -A INPUT -p tcp -s <172.20.0.10> --dport 80 -j ACCEPT


iptables -A INPUT -j LOG --log-prefix "Dropped Packet: "


iptables -A INPUT -j DROP

