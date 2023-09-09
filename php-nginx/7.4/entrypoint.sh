#!/bin/sh

# Start supervisord
echo "Starting supervisord..."
supervisord -c /supervisord.conf

# Keep the script running to keep the container alive
while true; do
  sleep 1
done
