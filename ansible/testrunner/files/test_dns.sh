#!/bin/sh

HOST=$1

OUTPUT=$(dig +short os3.nl @${HOST})

echo "$OUTPUT returned by $HOST"
