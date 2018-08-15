#!/bin/bash

HOST=$1

status_msg="$(mysql -u root -h $HOST 2>&1 >/dev/null)"

case "$status_msg" in
	*"ERROR 1130"*)
		echo "Remote connection not allowed for host ${HOST}"
		;;
	*"ERROR 2003"*)
		echo "MYSQL not listening for remote connections on default port on host ${HOST}"
		;;

	*)
		echo "$status_msg"
		;;
esac	
