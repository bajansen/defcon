#!/bin/sh

HOST=$1

MESSAGE="MQTT test message for $HOST"

mosquitto_sub -h $HOST -t '#' -t '$SYS' -C 1 -v &

mosquitto_pub -h $HOST -t "/research/$HOST" -m "$MESSAGE" --quiet

