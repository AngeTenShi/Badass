#!/bin/sh

if [ -z "$ETH0_IPV4" ]; then
	echo "Please define host IPV4"
	exit 1
fi

ip addr add $ETH0_IPV4/24 dev eth0
