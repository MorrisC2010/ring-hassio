#!/bin/bash
CONFIG_PATH=/data/options.json
export RING_REFRESH_TOKEN="$(jq --raw-output '.ring_refresh_token' $CONFIG_PATH)"
export CAMERA_NAME="$(jq --raw-output '.camera_name' $CONFIG_PATH)"
export RING_PORT="$(jq --raw-output '.port' $CONFIG_PATH)"

echo $CONFIG_PATH
echo $RING_REFRESH_TOKEN
echo $RING_PORT
echo $CAMERA_NAME

cd ./ring_hassio
node livestream.js
