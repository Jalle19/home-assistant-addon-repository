#!/usr/bin/with-contenv bashio

source config.sh

get-config

node --unhandled-rejections=warn /app/eda-modbus-bridge/dist/eda-modbus-bridge.js ${CMD_OPTIONS}
