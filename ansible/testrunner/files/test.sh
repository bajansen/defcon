#!/bin/sh

TEST=$1

while read HOST; do
	/vagrant/test_${TEST}.sh ${HOST}
	sleep 1
done < '/vagrant/hostlist.txt'
