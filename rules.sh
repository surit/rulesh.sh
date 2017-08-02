#!/bin/bash
iptables -I INPUT 1 -i lo -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
val=`iptables -L FORWARD --line-numbers | grep "NETWORK_STATS" | tail -1 | cut -d' ' -f1`
val1=`expr 1 + $val`
iptables -I FORWARD $val1 -m state --state RELATED,ESTABLISHED -j ACCEPT
