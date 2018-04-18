#!/bin/sh

# Stop dhcp :
UDHCP_PID=`ps | grep "udhcpd /etc/udhcpd.conf.wifi_bcm" | grep -v grep | awk -F " " '{print $1}'`
kill -9 $UDHCP_PID

# Start WPA Supplicant in deamon mode
wpa_supplicant -dd -B -D wext -i wifi_bcm -c /etc/wpa_supplicant.conf
sleep 3

# start DHCP Client and set address with Hostname
udhcpc -i wifi_bcm -s /usr/share/udhcpc/default.script -H $(hostname)

# for debug
#ifconfig
#iwconfig
