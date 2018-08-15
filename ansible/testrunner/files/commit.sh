#!/bin/sh

HOSTNAME=$1
HOSTIP=$2

sed -i "/${HOSTNAME}/d" /etc/hosts
sed -i "/${HOSTNAME}/d" /vagrant/hostlist.txt
echo $HOSTIP $HOSTNAME >> /etc/hosts
echo $HOSTNAME >> /vagrant/hostlist.txt
