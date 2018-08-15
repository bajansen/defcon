#!/bin/sh

HOST=$1

swaks --to bernardus.jansen@os3.nl --server $HOST --from test@testrunner.rp -ha
case "$?" in
	24)
		echo "Relay access denied by $HOST"
		;;
	2)
		echo "Server not listening on port 25 on $HOST"
		;;
	*)
		echo "edge case"
		;;
esac

swaks --to bernardus.jansen@os3.nl --server $HOST --from vagrant@$HOST -ha
case "$?" in
	24)
		echo "Relay access denied by $HOST"
		;;
	2)
		echo "Server not listening on port 25 on $HOST"
		;;
	*)
		echo "edge case"
		;;
esac
