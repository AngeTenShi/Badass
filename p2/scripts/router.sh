#!/bin/sh

alias ip="/sbin/ip"

if [ -z "$ETH0_IPV4" ] || [ -z "$VXLAN_IPV4" ]; then
	echo "Please define ETH0_IPV4 and VXLAN_IPV4"
	exit 1
elif [ "$DYNAMIC" = "1" ] && [ -z "$VXLAN_GROUP" ]; then
	echo "Multicast option requires a VXLAN_GROUP"
	exit 1
elif ( [ -z "$DYNAMIC" ] || [ "$DYNAMIC" = "0" ] ) && [ -z "$OTHER_ETH0_IPV4" ]; then
	echo "Please define OTHER_ETH0_IPV4 when not using static multicast."
	exit 1
fi

# give eth0 an ip and bring it up
ip addr add $ETH0_IPV4/24 dev eth0
ip link set dev eth0 up

# create vxlan10 and bring it up
if [ -z "$DYNAMIC" ]; then
	ip link add vxlan10 type vxlan id 10 dev eth0 remote $OTHER_ETH0_IPV4 local $ETH0_IPV4 dstport 4789
else
	ip link add vxlan10 type vxlan id 10 dev eth0 group $VXLAN_GROUP dstport 4789
fi
ip addr add $VXLAN_IPV4/24 dev vxlan10
ip link set dev vxlan10 up

# create bridge configure it then bring it up
ip link add br0 type bridge
brctl addif br0 vxlan10
brctl addif br0 eth1
ip link set dev br0 up
