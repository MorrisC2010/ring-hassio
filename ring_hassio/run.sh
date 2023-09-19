#!/bin/bash
CONFIG_PATH=/data/options.json

# Read configuration values with error handling
export RING_REFRESH_TOKEN="$(jq --raw-output '.ring_refresh_token' $CONFIG_PATH 2>/dev/null)"
export CAMERA_NAME="$(jq --raw-output '.camera_name' $CONFIG_PATH 2>/dev/null)"
export RING_PORT="$(jq --raw-output '.port' $CONFIG_PATH 2>/dev/null)"

# Check if any of the required values are missing
if [ -z "$RING_REFRESH_TOKEN" ] || [ -z "$CAMERA_NAME" ] || [ -z "$RING_PORT" ]; then
  echo "Error: One or more configuration values are missing or invalid."
  exit 1
fi

echo "CONFIG_PATH: $CONFIG_PATH"
echo "RING_REFRESH_TOKEN: $RING_REFRESH_TOKEN"
echo "RING_PORT: $RING_PORT"
echo "CAMERA_NAME: $CAMERA_NAME"

cd /ring-hassio/ring_hassio
node livestream.js
