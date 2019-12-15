#!/bin/sh
# Parameters:
#   $UDP_HOST
#   $UDP_PORT
#   $TCP_HOST
#   $TCP_PORT
#   $MODE

MODE=${MODE:client}

if [ "$MODE" = "client" ]; then
  udptunnel -c "$TCP_HOST/$TCP_PORT" -v "$UDP_HOST/$UDP_PORT" 
else
  udptunnel -s "$TCP_PORT" -v "$UDP_HOST/$UDP_PORT"
fi

